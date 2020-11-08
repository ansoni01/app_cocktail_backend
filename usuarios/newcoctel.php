<?php
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
    header('content-type: application/json; charset=utf-8');

    include "../db.php"; 

    if($_SERVER['REQUEST_METHOD'] === 'GET'){
        if(isset($_GET['id'])){
            /* if(is_numeric($_GET['id'])){
                $id=$_GET['id'];
                $q = mysqli_query(
                    $con, 
                    "SELECT * FROM `sitios` WHERE id_sitio = $id"
                );

                $data = $q->fetch_assoc();
                echo json_encode($data, JSON_UNESCAPED_UNICODE);
                echo mysqli_error($con);
            }else{
                echo("Error Varibale no numerica");
            } */
        } else {
            $data=array();

            $sql = "SELECT c.id_coctel, c.nombre, c.imagen AS img_coctel, 
            c.ingredientes, c.preparacion, u.id_user, u.nombre as usuario, u.img_user, 
            COUNT(co.id_coctel) as cant FROM usuarios u 
            RIGHT JOIN cocteles c ON c.id_user=u.id_user
            LEFT JOIN comentarios co ON co.id_coctel=c.id_coctel
            WHERE co.estado='A' OR co.estado IS NULL
            GROUP BY co.id_coctel, c.id_coctel"; 
            
            $q = mysqli_query($con, $sql); 

            while ($row = mysqli_fetch_assoc($q)){
                $data[] = $row;
            }
            
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
            echo mysqli_error($con);
        } 
    }
    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $data = json_decode(file_get_contents('php://input'));
        
        $id_user = $data->id_user;
        $nombre = $data->nombre;
        $imagen = $data->imagen;
        $ingredientes = $data->ingredientes;
        $preparacion = $data->preparacion;
        
        $cadenaSql = "INSERT INTO `cocteles` (`id_user`, `nombre`, `imagen`, `ingredientes`, `preparacion`) 
        VALUES ($id_user, '$nombre', '$imagen', '$ingredientes', '$preparacion')";

        $resultado = mysqli_query($con, $cadenaSql);
        if ($resultado) {
            //exit (json_encode($data));
            exit (json_encode(array('status' => 'success')));
        }else{
            exit (json_encode(array('status' => 'error')));
        }
    }

?> 
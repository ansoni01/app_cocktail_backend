<?php
    header('Content-Type: application/json; charset=utf-8');
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: PUT, GET, POST");
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    require 'db.php';

    if($_SERVER['REQUEST_METHOD'] === 'GET'){
        if(isset($_GET['id'])){
            $id=$_GET['id'];

            $sql = "SELECT c.id_user, coc.id_coctel, u.nombre, u.img_user, c.detalle 
            FROM comentarios c LEFT JOIN cocteles coc ON c.id_coctel=coc.id_coctel 
            LEFT JOIN usuarios u ON u.id_user=c.id_user WHERE c.estado='A' AND coc.id_coctel=$id";
            
            $q = mysqli_query($con, $sql);
            
            $data=array(); 
            while($row = $q->fetch_assoc())
            {
                $data[] = $row;
            }

            if($data != null){
                exit (json_encode($data, JSON_UNESCAPED_UNICODE));
            }else{
                exit (json_encode(array('status' => 'nulo')));
            }
            
            echo mysqli_error($con);
        }
    }
    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $data = json_decode(file_get_contents('php://input'));
        
        $id_coctel = $data->id_coctel;
        $id_user = $data->id_user;
        $detalle = $data->detalle;
        $estado = $data->estado;

        $sql = "INSERT INTO `comentarios` (`id_coctel`, `id_user`, `detalle`, `estado`) 
        VALUES ($id_coctel, $id_user, '$detalle', '$estado')";

        $resultado = mysqli_query($con, $sql);
        if ($resultado) {
            exit (json_encode(array('status' => 'success')));
        }else{
            exit (json_encode(array('status' => 'nulo')));
        }
        echo mysqli_error($con);
    }
?>
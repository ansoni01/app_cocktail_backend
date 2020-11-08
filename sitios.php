<?php
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
    header('content-type: application/json; charset=utf-8');

    include "db.php"; 

    if($_SERVER['REQUEST_METHOD'] === 'GET'){
        if(isset($_GET['id'])){
            if(is_numeric($_GET['id'])){
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
            }
        } else {
            $data=array(); 
            $q = mysqli_query($con, "SELECT * FROM `sitios` "); 

            while ($row = mysqli_fetch_array($q)){
                $data_row['id_sitio'] = $row['id_sitio'];
                $data_row['nombre_sitio'] = $row['nombre_sitio'];
                $data_row['telefeno'] = $row['telefeno']; 
                $data_row['ubicacion'] = $row['ubicacion'];  
                $data_row['longitud'] = $row['longitud'];
                $data_row['latitud'] = $row['latitud'];
                /* $data_row['h_apertura'] = $row['h_apertura'];
                $data_row['h_cerrado'] = $row['h_cerrado'];
                $data_row['id_tipo'] = $row['id_tipo']; */
                $data_row['sitio_img'] = $row['sitio_img'];
                
                array_push($data, $data_row);
            }
            
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
            echo mysqli_error($con);
        } 
    }
    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $data = json_decode(file_get_contents('php://input'));
        //echo (json_encode($data));
        $nombre = $data->nombre_sitio;
        $telefono = $data->telefeno;
        $ubicacion = $data->ubicacion;
        $longitud = $data->longitud;
        $latitud = $data->latitud;
        /* $h_apertura = $data->h_apertura;
        $h_cerrado = $data->h_cerrado;
        $id_tipo = $data->id_tipo; */
        $sitio_img = $data->sitio_img;
        
        //echo (json_encode($data));
        
        $cadenaSql = "INSERT INTO `sitios` (`nombre_sitio`, `telefeno`, `ubicacion`, `longitud`, `latitud`, `sitio_img`) 
        VALUES ('$nombre', '$telefono', '$ubicacion', $longitud, $latitud, '$sitio_img')";

        $resultado = mysqli_query($con, $cadenaSql);
        if ($resultado) {
            $sql = "SELECT id_sitio FROM sitios 
            WHERE nombre_sitio='$nombre' AND telefeno='$telefono' AND ubicacion='$ubicacion'
            AND latitud=$latitud ANd longitud=$longitud AND sitio_img='$sitio_img'";
            $q = mysqli_query($con, $sql);
            $id = 0;
            while ($row = mysqli_fetch_array($q)){
                $id = $row['id_sitio'];
            }
            
            $sql2 = " INSERT INTO sitios_usuarios (id_sitio, id_user, estado)
            VALUES ($id, $data->id_user, 'A')";
            $resul = mysqli_query($con, $sql2);
            if($resul){
                $data->id_sitio = $id;
                exit (json_encode($data));
            }
        }else{
            exit (json_encode(array('status' => 'error')));
        }
    }

?> 
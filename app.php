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
                    "SELECT * FROM `usuarios` WHERE id_user = $id"
                );

                $data = $q->fetch_assoc();
                echo json_encode($data);
                echo mysqli_error($con);
            }else{
                echo("Error Varibale no numerica");
            }
        } else {
            $data=array(); 
            $q = mysqli_query($con, "SELECT * FROM `usuarios` "); 

            while ($row = mysqli_fetch_object($q)){
                $data[] = $row; 
            }
            echo json_encode($data); 
            echo mysqli_error($con);
        } 
    } 

    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $data = json_decode(file_get_contents("php://input"));

        $password = $data->clave;
        //$user = $data->nombre;
        $hash = password_hash($password, PASSWORD_DEFAULT, ['cost' => 10]);
        if($data->fecha_naci == '0000-00-00'){
            $cadenaSql = "";
            $data->fecha_naci = null;
        $cadenaSql = $cadenaSql." INSERT INTO usuarios(nombre, clave, img_user, fecha_naci, id_rol, direccion, telefono) ";
        $cadenaSql = $cadenaSql." values('".$data->nombre."','".$hash."', '".$data->img_user."', ";
        $cadenaSql = $cadenaSql." $data->fecha_naci, ".$data->id_rol." ,'".$data->direccion."', ";
        $cadenaSql = $cadenaSql." '".$data->telefono."') ";
        }else{
            $cadenaSql = "";
            $cadenaSql = $cadenaSql." INSERT INTO usuarios(nombre, clave, img_user, fecha_naci, id_rol, direccion, telefono) ";
            $cadenaSql = $cadenaSql." values('".$data->nombre."','".$hash."', '".$data->img_user."', ";
            $cadenaSql = $cadenaSql." '".$data->fecha_naci."', ".$data->id_rol." ,'".$data->direccion."', ";
            $cadenaSql = $cadenaSql." '".$data->telefono."') ";
        }
        

        $resultado = mysqli_query($con, $cadenaSql);
        if ($resultado) {
            //$data->id_user = $con->insert_id;
            exit (json_encode($data));
        }else{
            exit (json_encode(array('status' => 'error')));
        }
    }

    if($_SERVER['REQUEST_METHOD'] === 'PUT'){

        if(isset($_GET['id'])){
            //Validamos recibir un tipo de dato entero
            if(is_numeric($_GET['id'])){
                $user_id = $_GET['id'];
                $data = json_decode(file_get_contents("php://input"));
                $cadenaSql="";
                $cadenaSql = $cadenaSql." UPDATE usuarios SET ";
                $cadenaSql = $cadenaSql." nombre='".$data->nombre."',";
                $cadenaSql = $cadenaSql." clave='".$data->clave."',";
                $cadenaSql = $cadenaSql." fecha_naci='".$data->fecha_naci."',";
                $cadenaSql = $cadenaSql." rol=".$data->rol.",";
                $cadenaSql = $cadenaSql." direccion='".$data->direccion."',";
                $cadenaSql = $cadenaSql." telefono='".$data->telefono."'";
                $cadenaSql = $cadenaSql." where id_user=$user_id";
    
                $resultado = mysqli_query($con, $cadenaSql);
                if($resultado){
                    //$data->id_user = $con->insert_id;
                    exit(json_encode($data));
                }else{
                    exit(json_encode(array('status'=>'error')));
                }
            }else{
                echo("Error Varibale no numerica");
            }
        }else{
            echo("Error variable no definida o no encontrada");
        }
    }
?>
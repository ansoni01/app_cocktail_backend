<?php
    include "db.php";
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
    header("Content-Type: application/json; charset=utf-8");
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Aceept");
    
    $_POST = json_decode(file_get_contents('php://input'), true);

    $username = $_POST['nombre'];
    $password = $_POST['clave'];

    $result = mysqli_query($con, "SELECT * FROM `usuarios` ");  
    
    $id = 0;

    while (($row = mysqli_fetch_array($result))!=NULL){
        $userBD = $row['nombre'];
        $claveBD = $row['clave'];
        if(password_verify($password, $claveBD) && $userBD === $username){
            $id = $row['id_user'];
        }
    }

    $query = "SELECT * FROM usuarios WHERE id_user=$id";
    $result = mysqli_query($con, $query);
    
    $userdata = array();
    
    while($row = mysqli_fetch_assoc($result)){
        $userdata[] = $row;
    }

    $message = array();
    if($result){
        if(mysqli_num_rows($result) !=0){
            $message = array('status' => 'true', 'message' => 'Successfully login!', 'userdata' => $userdata );
        } else {
            $message = array('status' => 'false', 'message' => '¡El nombre de usuario o la contraseña no coinciden!');
        }
        echo json_encode($message);
    }  
?>
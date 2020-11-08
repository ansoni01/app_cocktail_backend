<?php
    header('Content-Type: application/json; charset=utf-8');
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: PUT, GET, POST");
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    require '../db.php';

    if($_SERVER['REQUEST_METHOD'] === 'GET'){
        $sql =" SELECT u.id_user, s.id_sitio, vs.puntos, vs.estado 
        FROM valoracion_sitios vs INNER JOIN usuarios u INNER JOIN sitios s ON u.id_user=vs.id_user AND s.id_sitio=vs.id_sitio
        WHERE vs.estado='A'";

        $resultado = mysqli_query($con, $sql);
       
        while($row = $resultado->fetch_assoc())
        {
            $data[] = $row;
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        echo mysqli_error($con);
    }
    

    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $data = json_decode(file_get_contents("php://input"));
        
        $sql = "INSERT INTO valoracion_sitios (id_sitio, id_user, puntos, estado)
        VALUES ($data->id_sitio, $data->id_user, $data->puntos, '$data->estado')";
            
        $resultado = mysqli_query($con, $sql);
        if ($resultado) {
            exit (json_encode($data));
        }else{
            exit (json_encode(array('status' => 'error')));
        }
        echo mysqli_error($con);
        
    }

    if($_SERVER['REQUEST_METHOD'] === 'PUT'){

        $data = json_decode(file_get_contents("php://input"));

        $sql = " UPDATE valoracion_sitios SET puntos = $data->puntos 
        WHERE id_user=$data->id_user AND id_sitio=$data->id_sitio ";
            
        $resultado = mysqli_query($con, $sql);
        if ($resultado) {
            exit (json_encode($data));
        }else{
            exit (json_encode(array('status' => 'error')));
        }
        echo mysqli_error($con);

    }
?>
<?php
    header('Content-Type: application/json; charset=utf-8');
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: PUT, GET, POST");
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    require '../db.php';

    if($_SERVER['REQUEST_METHOD'] === 'GET'){
        $sql = "SELECT s.id_sitio, s.nombre_sitio, s.longitud, s.latitud, AVG(v.puntos) AS valoracion 
        FROM valoracion_sitios v LEFT JOIN sitios s ON s.id_sitio=v.id_sitio LEFT JOIN usuarios u 
        ON u.id_user=v.id_user WHERE v.estado='A'
        GROUP BY s.id_sitio ORDER BY valoracion DESC
        LIMIT 0, 10";
        
        $q = mysqli_query($con, $sql);
        //$data = $q->fetch_assoc();
        while($row = $q->fetch_array())
        {
            $data[] = $row;
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        echo mysqli_error($con);
    }
?>
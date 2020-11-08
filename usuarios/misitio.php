<?php
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
    header('content-type: application/json; charset=utf-8');

    include "../db.php"; 

    if($_SERVER['REQUEST_METHOD'] === 'GET'){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            
            $sql = "SELECT s.nombre_sitio, s.telefeno, s.ubicacion, s.sitio_img 
            FROM sitios_usuarios su LEFT JOIN usuarios u ON u.id_user=su.id_user 
            LEFT JOIN sitios s ON s.id_sitio=su.id_sitio
            WHERE u.id_user=$id";
            $q = mysqli_query($con, $sql);
            $data=array();
            while ($row = $q->fetch_assoc()){
                $data[] = $row;
            }
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
            echo mysqli_error($con);
        }
           
    }
?>
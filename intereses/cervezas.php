<?php
    include "../db.php"; 

    if($_SERVER['REQUEST_METHOD'] === 'GET'){
        if(isset($_GET['id'])){
            if(is_numeric($_GET['id'])){
                $id=$_GET['id'];
                $q = mysqli_query(
                    $con, 
                    "SELECT * FROM `cervezas` WHERE id_cer = $id"
                );

                $data = $q->fetch_assoc();
                echo json_encode($data);
                echo mysqli_error($con);
            }else{
                echo("Error Varibale no numerica");
            }
        } else {
            $data=array(); 
            $q = mysqli_query($con, "SELECT * FROM `cervezas` "); 

            while ($row = mysqli_fetch_object($q)){
                $data[] = $row; 
            }
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
            echo mysqli_error($con);
        } 
    }
?>
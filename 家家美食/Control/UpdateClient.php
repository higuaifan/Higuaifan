<?php
    ini_set("display_errors", "On");
    error_reporting(E_ALL | E_STRICT);
    include_once("../Service/conn.php");


    // $stmt=$conn->prepare("select * from Client");

    // $stmt=$conn->prepare("select * from client where id = ?");
    // $id=14;
    // $stmt->bind_param('i',$id);
    $stmt=$conn->prepare("update client set client_name=?,client_password=?,client_image=?,client_nickname=? where id=?");


    $stmt->bind_param('ssssi',$Name,$Pwd,$Pic,$Nickname,$id);
    $id=$_POST['id'];
    $Name=$_POST['client_name'];
    $Pwd=$_POST['client_password'];
    $Pic=$_POST['client_image'];
    $Nickname=$_POST['client_nickname'];

    echo $stmt->execute()?'true':'false';
   
    

    $stmt->close();
    mysqli_close($conn);
?>
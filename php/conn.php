<?php
$server = "qdm112455407.my3w.com";
$uid = "qdm112455407";
$pwd = "mysqlfortest";
$database="qdm112455407_db";
// $con=mysqli_connect($serverName,$uid,$pwd,$database); 
$conn=new mysqli("qdm112455407.my3w.com","qdm112455407","mysqlfortest","qdm112455407_db"); 
mysqli_query($conn,"SET NAMES utf8");
if (mysqli_connect_errno($conn)) 
    die("连接 MySQL 失败: " . mysqli_connect_error()); 

?>
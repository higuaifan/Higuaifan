<?php
session_start();
if(!isset($_SESSION['a_User'])||!isset($_SESSION['a_Password'])){
    exit();
}
$server = "rm-wz9h86151kd3mlx1io.mysql.rds.aliyuncs.com";
$uid = "zxmysql";
$pwd = "ZX123456zx";
$database="qdm112455407_db";
// $con=mysqli_connect($serverName,$uid,$pwd,$database); 
$conn=new mysqli("rm-wz9h86151kd3mlx1io.mysql.rds.aliyuncs.com","zxmysql","ZX123456zx","qdm112455407_db"); 
// $conn=new mysqli("localhost:3306","root","root","JiaJiaFood"); 
mysqli_query($conn,"SET NAMES utf8");
if (mysqli_connect_errno($conn)) 
    die("连接 MySQL 失败: " . mysqli_connect_error()); 


?>
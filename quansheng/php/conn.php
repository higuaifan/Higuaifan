<?php
ini_set("display_errors", "On");
error_reporting(E_ALL | E_STRICT);
session_start();
$server = "rm-wz9h86151kd3mlx1io.mysql.rds.aliyuncs.com";
$conn=new mysqli("rm-wz9h86151kd3mlx1io.mysql.rds.aliyuncs.com","zxmysql","ZX123456zx!","quansheng");
mysqli_query($conn,"SET NAMES utf8");
if (mysqli_connect_errno($conn)) 
    die("连接 MySQL 失败: " . mysqli_connect_error()); 


?>
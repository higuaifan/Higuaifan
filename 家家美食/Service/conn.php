<?php
$server = "rm-wz9h86151kd3mlx1io.mysql.rds.aliyuncs.com";
$uid = "zxmysql";
$pwd = "ZX123456zx";
$database="test";
// $con=mysqli_connect($serverName,$uid,$pwd,$database); 
$conn=new mysqli("rm-wz9h86151kd3mlx1io.mysql.rds.aliyuncs.com","zxmysql","ZX123456zx","test"); 
mysqli_query($conn,"SET NAMES utf8");
if (mysqli_connect_errno($conn)) 
    die("连接 MySQL 失败: " . mysqli_connect_error()); 

?>
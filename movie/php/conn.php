<?php
session_start();
$conn = new mysqli("rm-wz9h86151kd3mlx1io.mysql.rds.aliyuncs.com", "zxmysql", "ZX123456zx!", "spider");
// $conn=new mysqli("localhost:3306","root","root","JiaJiaFood"); 
mysqli_query($conn, "SET NAMES utf8");
if (mysqli_connect_errno($conn))
    die("连接 MySQL 失败: " . mysqli_connect_error());

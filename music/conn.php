<?php
session_start();
$uid = "zxmysql";
$pwd = "ZX123456zx!";
$serverName = "rm-wz9h86151kd3mlx1io.mysql.rds.aliyuncs.com:3306";
// $serverName = "localhost:3306";
$conn = mysql_connect($serverName,$uid,$pwd);
mysql_select_db('music');
if( $conn === false ) {
    die( print_r(mysql_error(), true));
}



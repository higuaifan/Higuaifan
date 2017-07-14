<?php
session_start();
$uid = "root";
$pwd = "root";
$serverName = "localhost:3306";
$conn = mysqli_connect($serverName, $uid, $pwd);
mysqli_select_db($conn,'xdd');
if ($conn === false) {
    die('error');
}



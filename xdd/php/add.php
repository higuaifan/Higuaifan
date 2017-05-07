<?php
include_once("conn.php");
$name = $_POST['user'];
$pwd = $_POST['pwd'];

$stmt = $conn->prepare("insert into shopper (`name`,`password`,`type`) values (?,?,0)");
$stmt->bind_param('ss', $name, $pwd);
echo $stmt->execute()?"true":"false";
$stmt->close();
mysqli_close($conn);
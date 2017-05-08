<?php
include_once("conn.php");
$stmt = $conn->prepare("insert into shopper (`name`,`password`,`type`) values (?,?,?)");
$stmt->bind_param("sss", $name, $password, $types);
$name = $_POST["name"];
$password = $_POST["password"];
$types = $_POST["type"];
echo $stmt->execute() ? "true" : "false";
$stmt->close();
mysqli_close($conn);


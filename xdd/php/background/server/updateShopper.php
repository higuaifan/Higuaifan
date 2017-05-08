<?php
include_once("conn.php");
$stmt = $conn->prepare("update shopper set `name` = ? ,`password` = ?,`type`=? where id=?");
$stmt->bind_param("sssi",$name, $password, $types, $ID);
$name = $_POST["name"];
$password = $_POST["password"];
$types = $_POST["type"];
$ID = $_POST["ID"];
echo $stmt->execute() ? "true" : "false";
$stmt->close();
mysqli_close($conn);

<?php
include_once("conn.php");
$stmt = $conn->prepare("insert into press (title,message,edit,`type`) values (?,?,?,?)");
$stmt->bind_param("sssi", $title, $message, $edit, $type);
$title = $_POST["title"];
$message = $_POST["message"];
$edit = $_POST["edit"];
$type = $_POST["type"];
echo $stmt->execute() ? "true" : "false";
$stmt->close();
mysqli_close($conn);

<?php
include_once("conn.php");
$stmt=$conn->prepare("delete from shopper where ID=?");
$stmt->bind_param("i",$id);
$id=$_POST["id"];
echo $stmt->execute()?"true":"false";
$stmt->close();
mysqli_close($conn);
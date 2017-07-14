<?php
include_once("conn.php");
$name = $_POST['user'];
$pwd = $_POST['pwd'];

$stmt = $conn->prepare("select * from shopper where `name` = ? and password = ?");
$stmt->bind_param('ss', $name, $pwd);
$stmt->execute();
$result = $stmt->get_result();
$rowArray = $result->fetch_all(MYSQLI_ASSOC);

if (sizeof($rowArray) > 0) {
    $_SESSION['type'] =$rowArray[0]['type'];
    echo 'true';
} else {
    unset($_SESSION['type']);
    echo 'false';
}
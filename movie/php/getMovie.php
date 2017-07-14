<?php
include_once("conn.php");
header('Content-type: text/json;charset=utf-8');
$stmt = $conn->prepare("SELECT * FROM spider.movie order by score desc");
$stmt->execute();
$result = $stmt->get_result();
$data = $result->fetch_all(MYSQLI_ASSOC);
echo json_encode($data, JSON_UNESCAPED_UNICODE);
$stmt->close();
mysqli_close($conn);
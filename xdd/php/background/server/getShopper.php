<?php
include_once("conn.php");
header('Content-type: text/json');
$page=(isset($_POST["page"]))?$_POST["page"]:0;
$row=(isset($_POST["row"]))?$_POST["row"]:5;
$start=$page*$row;
//$stmt=$conn->prepare("select * from shopper limit ?,?");
$stmt=$conn->prepare("select * from shopper");
//$stmt->bind_param("ii",$start,$row);
$stmt->execute();
$result=$stmt->get_result();
$rowarray=$result->fetch_all(MYSQLI_ASSOC);
$resultarr=array();
foreach($rowarray as $arr){
    $time=count($arr);
    $keyarr=array_keys($arr);
    $i=0;
    array_push($resultarr,$arr);
}
$stmt=$conn->prepare("select count(*) as num from shopper");
$stmt->bind_result($num);
$stmt->execute();
$result=$stmt->get_result();
$number=$result->fetch_array(MYSQLI_NUM);
$return=array();
$return["pagetimes"]=ceil($number[0]/$row);
$return["data"]=$resultarr;

print_r(json_encode($return,JSON_UNESCAPED_UNICODE));
$stmt->close();
mysqli_close($conn);
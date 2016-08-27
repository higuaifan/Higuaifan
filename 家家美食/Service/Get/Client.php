<?php
    ini_set("display_errors", "On");
    error_reporting(E_ALL | E_STRICT);
    include_once("../conn.php");

    $stmt=$conn->prepare("select * from Client");

    // $stmt=$conn->prepare("select * from client where id = ?");
    // $id=14;
    // $stmt->bind_param('i',$id);

    $stmt->bind_result($id,$Name,$Pwd,$Pic,$Nickname);
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
    echo json_encode($resultarr,JSON_UNESCAPED_UNICODE); 
    $stmt->close();
    mysqli_close($conn);
?>
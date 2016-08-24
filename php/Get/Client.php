<?php
    ini_set("display_errors", "On");
    error_reporting(E_ALL | E_STRICT);
    include_once("../conn.php");
    // $stmt=$conn->prepare("select * from Client");
    $stmt=$conn->prepare("select * from Client where id = ?");
    $id=14;
    $stmt->bind_param('i',$id);
    $stmt->bind_result($id,$Name,$pid,$pnum,$Pwd,$Pic,$Nickname);
    $stmt->execute();
    $result=$stmt->get_result();
    $rowarray=$result->fetch_all(MYSQLI_ASSOC);
    $resultarr=array();
    // print_r($rowarray);
    foreach($rowarray as $arr){
        $time=count($arr);
        $keyarr=array_keys($arr);
        $i=0;
        // while($i<$time){
        //     $arr[$keyarr[$i]]=iconv("gb2312","utf-8//ignore", $arr[$keyarr[$i]]);
        //     $i=$i+1;
        // }
        array_push($resultarr,$arr);
    }
    echo json_encode($resultarr,JSON_UNESCAPED_UNICODE); 
    mysqli_close($conn);
?>
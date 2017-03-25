<?php
session_start();

//Link sqlserver block start
$uid = "root";
$pwd = "root";
$serverName = "localhost:3306";
$conn = mysqli_connect($serverName, $uid, $pwd);
mysqli_select_db($conn,'xdd');
if ($conn === false) {
    die(print_r(mysql_error(), true));
}
//End

//  ini_set("display_errors", "On");
//  error_reporting(E_ALL | E_STRICT);

function CheckPWD($client, $pwd, $conn)
{
    $sql = "select ID from Client where CName='$client' and Pwd ='$pwd'";
    $stmt = mysqli_query($sql, $conn);
    $rowarray = array();
    if ($stmt === false) {
        die(print_r(mysqli_error(), true));
    } else {
        if ($row = mysqli_fetch_object($stmt)) {
            $arr = (array)($row);

            // mysqli_close($conn);
            return $arr['ID'];
        }

    }
    //mysqli_close($conn);
    return 0;
}

?>

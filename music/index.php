<?php
include 'conn.php';
ini_set("display_errors", "On");
error_reporting(E_ALL | E_STRICT);
$table = $_POST['table'];
$result["result"] = 0;
$result["msg"] = '请求成功';
switch ($table) {
    case 'singer':
        $sql = "select * from singer";
        break;
    case 'song':
        $sql = "SELECT song_name,singer.name,album,`time`,style.type,url FROM music.songs,music.singer,music.style where style.id=songs.style and singer_id=singer.id;";
        break;
    case 'style':
        $sql = "select * from style";
        break;
    case 'songByStyle':
        $sql = "select songs.song_name,style.type from song_to_style,songs,style where songs.id=song_to_style.song and song_to_style.style=style.id";
        break;
    default:
        $result["result"] = 1;
        $result["msg"] = '请求错误';
        echo json_encode($result, JSON_UNESCAPED_UNICODE);
        exit();
}
$stmt = mysql_query($sql, $conn);
$rowarray = array();
if ($stmt === false) {
    die(print_r(mysql_error(), true));
} else {
    $total = 0;
    while ($row = mysql_fetch_object($stmt)) {
        $arr = (array)($row);
        $time = count($arr);
        $keyarr = array_keys($arr);
        $i = 0;
        array_push($rowarray, $arr);
        $total++;
    }
    $result["total"] = $total;
    $result["rows"] = $rowarray;
}
echo json_encode($result, JSON_UNESCAPED_UNICODE);
mysql_close($conn);

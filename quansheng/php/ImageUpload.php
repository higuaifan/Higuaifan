<?php
//ini_set("display_errors", "On");
//error_reporting(E_ALL | E_STRICT);
require_once 'aliyun-oss-php-sdk-master/samples/Common.php';
require_once 'aliyun-oss-php-sdk-master/autoload.php';
header('Content-Type: text/plain; charset=utf-8');

use OSS\OssClient;
use OSS\Core\OssException;

$bucket = Common::getBucketName();
$ossClient = Common::getOssClient();

$table = $_POST['table'];
$imageName = $_POST['name'];
$return = array();
$return["msg"] = 'error';
$ossClient->setTimeout(3600);
$ossClient->setConnectTimeout(10);

try {
    if ($_FILES["file"]["error"] > 0) {
        $return["msg"] = $_FILES["file"]["error"];
    } else {
        $imageName = iconv("UTF-8", "GB2312", $_FILES["file"]["name"]);
        if (move_uploaded_file($_FILES["file"]["tmp_name"], "pic/$table/$imageName"))
//            if (uploadFile($ossClient, $bucket, $table, $imageName))
            $return["msg"] = 'success';
    }
} catch (RuntimeException $e) {
    $return["msg"] = $e->getMessage();
}
echo json_encode($return, JSON_UNESCAPED_UNICODE);


function uploadFile($ossClient, $bucket, $table, $imageName)
{
    $object = "$table/$imageName.jpg";
//    $filePath = __FILE__;
    $filePath = "pic/$table/$imageName.jpg";
    $options = array();

    try {
        $ossClient->uploadFile($bucket, $object, $filePath, $options);
    } catch (OssException $e) {
        printf(__FUNCTION__ . ": FAILED\n");
        printf($e->getMessage() . "\n");
        return false;
    }
    return true;
}


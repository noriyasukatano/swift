<?php
 $conn = mysqli_connect("mysql022.phy.lolipop.lan", "LAA0584815", "readgirl", "LAA0584815-readgirl");
 mysqli_set_charset($conn, 'utf8');
 $result = mysqli_query($conn, "SELECT * FROM music");
 $data = array();
 while ($row = mysqli_fetch_object($result)) {
    $item = array(
    'id'=> $row -> id,
    'title'=> mb_convert_encoding($row -> title, 'UTF-8', 'auto'),
    'author'=> mb_convert_encoding($row -> author, 'UTF-8', 'auto'),
    'description'=> mb_convert_encoding($row -> description, 'UTF-8', 'auto'),
    'url'=>$row -> url,
    'time'=>$row -> time,
    'version'=>$row -> version
    );
    array_push($data, $item);
 }

 // echo $jsonstr;
 // print_r($jsonstr);
echo json_encode($data, JSON_UNESCAPED_UNICODE);

?>

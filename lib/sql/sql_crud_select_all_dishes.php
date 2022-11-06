<?php
header('Content-Type: application/json; charset=utf-8');
include ('connection.php');

if(mysqli_connect_error()){
    die('Connect Error('.mysqli_connect_error().')'. mysqli_connect_error());
    exit();
}
$sql = "SELECT * FROM dishes";
$result = $conn->query($sql);
$output= array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()){
        array_push($output, $row);
    }
}else{
    echo "error";
}
$conn->close();
echo json_encode($output);
?>
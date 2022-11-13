<?php
define('TIMEZONE', 'Europe/Rome');
date_default_timezone_set(TIMEZONE);
include ('connection.php');

$action =$_POST['action'];
//ger all dishes from database
if("GET_ALL_DISHES"==$action){
    $sql = "SELECT * FROM dishes";
    $result = $conn->query($sql);
    $output= array();
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()){
            array_push($output, $row);
        }
        echo json_encode($output);
    }else{
        echo "error";
    }
    $conn->close();
    return;
}
//add New order 

if("ADD_ORDER"==$action){
   
    $numberCustomer = $_POST['numberCustomer'];
    $dataOrder = date('Y-m-d H:i:s');
    $cost= $_POST['cost'];
    $sql = "INSERT INTO orders (numberCustomer,dataOrder,cost,tableID,priceBookID,paymentID) VALUES( $numberCustomer,'$dataOrder',$cost,0,0,5)";
    $result = $conn->query($sql);

    $conn->close();
    return;

    if ($conn->connect_errno) {
        echo "Failed to connect to MySQL: " . $conn -> connect_error;
    }else{
        echo  $result;
        echo "Success to connect to MySQL: " . $conn -> connect_error;
    }
/*
    echo $numberCustomer;
    $sql1 = "INSERT INTO tables (numberTable) VALUES(  $numberCustomer )";
    $result = $conn->query($sql1);
    if ($conn->connect_errno) {
        echo "Failed to connect to MySQL: " . $conn -> connect_error;
    }else{
        echo "success to connect to MySQL: " . $conn -> connect_error;
    }
    $conn->close();
    return;*/
}

?>
<?php

include 'config.php';

$json = file_get_contents('php://input');

//decode Json received
$obj = json_decode($json,true);

$email = $obj['email'];
$password = $obj['password'];


$queryResult = $connect->query("SELECT * from User where userEmail='".$email."' and userpass = '".$password."' ");

$result = array();

while( $fetchData=$queryResult->fetch_assoc())
{
	$result[] = $fetchData;
}

echo json_encode($result);

?>
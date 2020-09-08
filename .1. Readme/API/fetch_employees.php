<?php
include 'config.php';

$queryResult = $connect->query("SELECT empFname FROM Employee");

$result = array();

while( $fetchData=$queryResult->fetch_assoc())
{
	$result[] = $fetchData;
}

echo json_encode($result);

?>
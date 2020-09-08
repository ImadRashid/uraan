<?php
 
//Define your Server host name here.
$HostName = "localhost";
 
//Define your MySQL Database Name here.
$DatabaseName = "hjfbxhev_monies";
 
//Define your Database User Name here.
$HostUser = "hjfbxhev_monies";

//Define your Database Password here.
$HostPass = "Pakistan1234!@#$"; 
 
// Creating MySQL Connection.
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
// Storing the received JSON into $json variable.
$json = file_get_contents('php://input');
 
// Decode the received JSON and Store into $obj variable.
$obj = json_decode($json,true);
 
// Getting name from $obj object.
$name = $obj['name'];
 
// Getting Email from $obj object.
$email = $obj['email'];

// Getting Phone Number
$phone = $obj['phone'];
 
// Getting Password from $obj object.
$password = $obj['password'];

// Checking whether Email is Already Exist or Not in MySQL Table.
//$CheckEmail = "SELECT * FROM User WHERE userEmail ='$email' ";
//$CheckUsername = "SELECT * FROM User WHERE username='$email' ";
$CheckEmail = "SELECT * FROM User WHERE userEmail ='$email' ";

// Executing Email and Phone Check MySQL Query.

$check = mysqli_fetch_array(mysqli_query($con,$CheckEmail));


if(isset($check)){

	 $emailExist = 'Email Already Exist, Please Try Again With New Email Address..!';
	 
	 // Converting the message into JSON format.
	$existEmailJSON = json_encode($emailExist);
	 
	// Echo the message on Screen.
	 echo $existEmailJSON ; 

  }
 else{

	 // Creating SQL query and insert the record into MySQL database table.
	 $Sql_Query = "insert into User (fullname,userpass,userEmail,userRecoveryPhone) values ('$name','$password','$email','$phone')";
	 

	 
	 if(mysqli_query($con,$Sql_Query)){
	 
		 // If the record inserted successfully then show the message.
		$MSG = 'User Registered Successfully' ;
		 
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		 
		// Echo the message.
		 echo $json ;
	 
	 }
	 else{
	 
		echo 'Try Again';
	 
	 }
 }
 mysqli_close($con);
?>
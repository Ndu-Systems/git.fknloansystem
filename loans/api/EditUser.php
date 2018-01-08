<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));
   
     $UserId = $data->UserId;
	$UserName = $data->UserName;
    $EmailAddress= $data->EmailAddress;
	$Password = $data->Password;	 
	$IsActive = $data->IsActive;
    $Role    = $data->Role;
    $url    = $data->url;

        $sql = "UPDATE `users` SET
                        `UserName`='$UserName',
                        `Password`='$Password',
                        `Role`='$Role',
                        `IsActive`='$IsActive',
                        `EmailAddress`='$EmailAddress',
                        `url`='$url',
                        `ModifyDate`=NOW(),
                        `ModifyUserId`='$UserId' WHERE UserId = '$UserId'";        
        
        if ($conn->query($sql) === TRUE) {
            echo 1;
        }
        else {
            //echo json_encode('failed');
            echo "Error: " . $sql . "<br>" . $conn->error;
        }    
?>

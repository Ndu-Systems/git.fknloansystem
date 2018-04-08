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

        $result = $conn->prepare( "UPDATE `users` SET
                        `UserName`=?,
                        `Password`=?,
                        `Role`=?,
                        `IsActive`=?,
                        `EmailAddress`=?,
                        `url`=?,
                        `ModifyDate`=Now(),
                        `ModifyUserId`=? WHERE UserId =?"); 
		
        
        if ($result->execute(array($UserName,$Password,$Role,$IsActive,$EmailAddress,$url,$UserId,$UserId))) {
            echo 1;
        }
        else {
            //echo json_encode('failed');
            echo "Error: He's Dead Jim!";
        }    
?>

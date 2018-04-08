<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));

               $CustomerId	=	$data->CustomerId;
               $LoanId		=	$data->LoanId;
               $Description	=	$data->Description;
			   $Url			=	$data->Url;
               $Status		=	$data->Status;
               $userId		=	$data->userId;
			  
			$result = $conn -> prepare( "INSERT INTO `documents`(`CustomerId`, `LoanId`, `Description`, `Url`, `Status`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) 
                    VALUES (?,?,?,?,?,NOW(),?,NOW(),?)");		 
			
				if ($result->execute(array($CustomerId,$LoanId,$Description,$Url,$Status,$userId,$userId))) {
					echo 1;
				} else {
				echo 0;
				}						
						

?>



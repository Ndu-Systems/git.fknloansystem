<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));

               $CustomerId =	$data->CustomerId;
               $doc	=	$data->doc;               		   
			  
			$sql = "
			UPDATE  customer  SET
			 url = '$doc' 			 			 
			WHERE CustomerId= $CustomerId			
				";								
								
				if ($conn->query($sql) === TRUE) {
					echo 1;
				} else {
				echo 0;
				}					
						

?>



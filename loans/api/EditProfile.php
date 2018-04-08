<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));

               $CustomerId =	$data->CustomerId;
               $doc	=	$data->doc;               		   
			  
			$result = $conn -> prepare( "
			UPDATE  customer  SET
			 url = ? 			 			 
			WHERE CustomerId= ?			
				");								
								
				if ($result -> execute(array($doc,$CustomerId))) {
					echo 1;
				} else {
				echo 0;
				}					
						

?>



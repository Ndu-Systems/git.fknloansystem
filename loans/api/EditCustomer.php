<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));

             $CustomerId = $data->CustomerId; 
             $FirstName = $data->FirstName;
             $LastName = $data->LastName;
             $CellNumber = $data->CellNumber;
             $EmailAddress = $data->EmailAddress;
             $IdNumber = $data->IdNumber;
             $Location = $data->Location;
             $Address = $data->Address;
             $BankName = $data->BankName;
             $AccountNumber = $data->AccountNumber;
             $BranchCode = $data->BranchCode;
             $AccountType = $data->AccountType;
             $IsActive = $data->IsActive;
             $userId = $data->userId;  
             $WorkAddress = $data->WorkAddress;
             $Department = $data->Department;
             $CallSign = $data->CallSign;
             $NOKName = $data->NOKName;
             $NOKContactNumber = $data->NOKContactNumber;
             $NOKAddress = $data -> NOKAddress;
             $StationedArea = $data -> StationedArea;
             $EmployerCellNumber = $data -> EmployerCellNumber;
             $EmployerName = $data -> EmployerName;                
                          
										 $result = $conn -> prepare( "
											UPDATE  customer  SET	 
											 FirstName = ?, 
											 LastName =?,
											 CellNumber =?,
											 EmailAddress =?,
											 IdNumber =?,
											 Location =?,
											 Address =?,
											 BankName =?,
											 AccountNumber = ?,
											 BranchCode =?,			 
											 AccountType =?,
											 IsActive = ?,
											 ModifyDate = NOW(),                 
											 ModifyUserId =?,
											 CallSign = ?,
											 WorkAddress = ?,
											 Department =?,
											 NOKName = ?,
											 NOKContactNumber = ?,
											 NOKAddress =?,
											 stationedarea = ?,
											 EmployerCellNumber =?,
											 EmployerName = ?            

											WHERE CustomerId= ? 		
											");								
								
				if ($result->execute(array($FirstName,$LastName,$CellNumber,$EmailAddress,$IdNumber,$Location,$Address,$BankName
						,$AccountNumber,$BranchCode,$AccountType,$IsActive,$userId,$CallSign,$WorkAddress,$Department,$NOKName,$NOKContactNumber,$NOKAddress,
						$StationedArea,$EmployerCellNumber,$EmployerName,$CustomerId))) {
					echo 1;
				} else {
				   echo "Error: He's Dead Jim!";
				}						
						

?>



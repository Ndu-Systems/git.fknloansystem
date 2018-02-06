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
                          
             $sql = "
				UPDATE  customer  SET	 
				 FirstName = '$FirstName', 
				 LastName ='$LastName',
                 CellNumber ='$CellNumber',
                 EmailAddress ='$EmailAddress',
                 IdNumber ='$IdNumber',
                 Location ='$Location',
                 Address ='$Address',
                 BankName ='$BankName',
				 AccountNumber = '$AccountNumber',
				 BranchCode ='$BranchCode',			 
				 AccountType ='$AccountType',
				 IsActive = '$IsActive',
				 ModifyDate = NOW(),                 
				 ModifyUserId = '$userId',
                 CallSign = '$CallSign',
                 WorkAddress = '$WorkAddress',
                 Department = '$Department',
                 NOKName = '$NOKName',
                 NOKContactNumber = '$NOKContactNumber',
                 NOKAddress = '$NOKAddress',
                 stationedarea = '$StationedArea',
                 EmployerCellNumber = '$EmployerCellNumber',
                 EmployerName = '$EmployerName'             

				WHERE CustomerId= '$CustomerId' 		
				";								
								
				if ($conn->query($sql) === TRUE) {
					echo 1;
				} else {
				echo 0;
				}						
						

?>



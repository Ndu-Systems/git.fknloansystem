 <?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));

if (isset($data->EmailAddress) ){  
    $FirstName = $data ->FirstName;
    $LastName = $data ->LastName;
    $CellNumber = $data ->CellNumber;
    $EmailAddress = $data ->EmailAddress;
    $IdNumber = $data ->IdNumber;
    $Location = $data ->Location;
    $Address = $data ->Address;
    $BankName = $data ->BankName;
	$AccountNumber = $data->AccountNumber;	 
	$BranchCode = $data->BranchCode;
    $AccountType = $data->AccountType;
	$IsActive = $data->IsActive;
    $userId = $data->userId;
    $url = $data->url;
    $WorkAddress = $data->WorkAddress;
    $Department = $data->Department;
    $CallSign = $data->CallSign;
    $NOKName = $data->NOKName;
    $NOKContactNumber = $data->NOKContactNumber;
    $NOKAddress = $data -> NOKAddress;
    $StationedArea = $data -> StationedArea;
    $EmployerCellNumber = $data -> EmployerCellNumber;
    $EmployerName = $data -> EmployerName;
    
        $result = $conn -> prepare( "INSERT INTO `customer`( `FirstName`, `LastName`, `CellNumber`, `EmailAddress`, `IdNumber`, `Location`, `Address`, `BankName`, `AccountNumber`, `BranchCode`, `AccountType`, `IsActive`, `url`,`EmployerName`, `EmployerCellNumber`, `WorkAddress`, `Department`, `CallSign`, `stationedarea`, `NOKName`,`NOKContactNumber`,`NOKAddress`,`CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`)
                VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),?,NOW(),?)");        

        
        if ($result->execute(array($FirstName,$LastName,$CellNumber,$EmailAddress,$IdNumber,$Location,$Address,$BankName,$AccountNumber,$BranchCode,$AccountType,$IsActive,$url,$EmployerName,$EmployerCellNumber,$WorkAddress,$Department,$CallSign,$StationedArea,$NOKName,$NOKContactNumber,$NOKAddress,$userId,$userId))) {
            echo 1;
        }
        else {
            //echo json_encode('failed');
            echo "Error: " . $conn . "<br>" . $result->error;
        }       
        
 
}
 else {

	echo json_encode( "500");
}
?>
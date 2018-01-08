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
    
        $sql = "INSERT INTO `customer`( `FirstName`, `LastName`, `CellNumber`, `EmailAddress`, `IdNumber`, `Location`, `Address`, `BankName`, `AccountNumber`, `BranchCode`, `AccountType`, `IsActive`, `url`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`)
                VALUES ('$FirstName','$LastName',$CellNumber,'$EmailAddress','$IdNumber','$Location','$Address','$BankName',$AccountNumber,'$BranchCode','$AccountType',$IsActive,'$url',NOW(),$userId,NOW(),$userId)";        
        
        if ($conn->query($sql) === TRUE) {
            echo 1;
        }
        else {
            //echo json_encode('failed');
            echo "Error: " . $sql . "<br>" . $conn->error;
        }       
        
 
}
 else {

	echo json_encode( "500");
}
?>
<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));
if (isset($data->LoanId) ){
$LoanId = $data->LoanId;
$ModifyUserId =$data->ModifyUserId;

  $sql = "UPDATE loan SET
                        Status=0,
                        ModifyDate=NOW(),
                        ModifyUserId='$ModifyUserId'
						WHERE LoanId = '$LoanId'";        
        
        if ($conn->query($sql) === TRUE) {
            echo 1;
        }
        else {
            //echo json_encode('failed');
            echo "Error: " . $sql . "<br>" . $conn->error;
        }    
}
else{
	echo 500;
}

?>


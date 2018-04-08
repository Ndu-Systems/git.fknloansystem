<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));
if (isset($data->LoanId) ){
$LoanId = $data->LoanId;
$ModifyUserId =$data->ModifyUserId;

  $result = $conn -> prepare( "UPDATE loan SET
                        Status=?,
                        ModifyDate=NOW(),
                        ModifyUserId=?
						WHERE LoanId = ?");        
        
        if ($result->execute(array(0,$ModifyUserId,$LoanId))) {
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


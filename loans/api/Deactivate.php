<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));
if (isset($data->CustomerId) ){
$CustomerId = $data->CustomerId;
$ModifyUserId =$data->ModifyUserId;

  $result = $conn -> prepare("UPDATE customer SET
                        IsActive=?,
                        ModifyDate=NOW(),
                        ModifyUserId=?
						WHERE CustomerId = ?");        
        
        if ($result->execute(array(0,$ModifyUserId,$CustomerId))) {
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


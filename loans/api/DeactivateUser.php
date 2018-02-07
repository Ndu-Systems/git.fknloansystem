<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));
if (isset($data->CustomerId) ){
$CustomerId = $data->CustomerId;
$ModifyUserId =$data->ModifyUserId;

  $sql = "UPDATE users SET
                        IsActive=0,
                        ModifyDate=NOW(),
                        ModifyUserId=$ModifyUserId
						WHERE UserId = $CustomerId";        
        
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


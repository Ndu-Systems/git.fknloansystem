<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));
if (isset($data->CustomerId) ){
$CustomerId = $data->CustomerId;
$ModifyUserId =$data->ModifyUserId;

  $result = $conn -> prepare( "UPDATE users SET
                        IsActive=?,
                        ModifyDate=NOW(),
                        ModifyUserId=?
						WHERE UserId = ?");        
        
        if ($result->execute(array(0,$ModifyUserId,$CustomerId))) {
            echo 1;
        }
        else {
            //echo json_encode('failed');
			echo "Error: He's Dead Jim!";
        }    
}
else{
	echo 500;
}

?>


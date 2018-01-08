 <?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));

if (isset($data->EmailAddress) ){  
    $EmailAddress = $data ->EmailAddress;
    $UserName = $data ->UserName;
	$IsActive = 1;
    $userId = $data->userId;
    $Password = "123456";
    $Role = 1;
    $LastLoginDate= null;
    $url = $data->url;
    
        $sql = "INSERT INTO `users`(`UserName`, `Password`, `Role`, `LastLoginDate`, `IsActive`, `EmailAddress`, `url`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) 
                    VALUES ('$UserName','$Password',1,null,1,'$EmailAddress','$url',NOW(),$userId,NOW(),$userId)";        
        
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
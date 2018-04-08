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
       
		
		$result = $conn -> prepare("select * from Users where EmailAddress = ?");
		$result -> execute(array($EmailAddress));

		if($result->rowCount() == 0){		

			 $result = $conn -> prepare( "INSERT INTO `users`(`UserName`, `Password`, `Role`, `IsActive`, `EmailAddress`, `url`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) 
                    VALUES (?,?,?,?,?,?,Now(),?,Now(),?)");        
        
			if ($result->execute(array($UserName,$Password,1,1,$EmailAddress,$url,$userId,$userId))) {
				echo 1;
			}
			else {
				//echo json_encode('failed');
				   echo "Error: He's Dead Jim!";
			} 
		}
		else {
				echo "User Email Account Taken";
		} 
}
 else {

	echo json_encode( "500");
}
?>
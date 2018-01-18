 <?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));

if (isset($data->CustomerId) ){  
    $CustomerId = $data ->CustomerId;
    $LoanAmount =$data ->LoanAmount;
    $PaidAmount =$data ->PaidAmount;
    $Balance =$data ->Balance;
    $Interest =$data ->Interest;
    $LoanTerm =$data ->LoanTerm;
    $userId =$data ->userId;  
    $AmountPayable = $data -> AmountPayable;
    
        $sql = "INSERT INTO `loan`(`CustomerId`, `LoanAmount`, `PaidAmount`, `Balance`, `AmountPayable`,`LoanTerm`,`Interest`, `LoanDate`,`Status`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) 
                VALUES ('$CustomerId','$LoanAmount','$PaidAmount','$Balance','$AmountPayable','$LoanTerm','$Interest',NOW(),1,NOW(),'$userId',NOW(),'$userId')";

        if ($conn->query($sql) === TRUE) {
            echo 1;
			require 'AddTransiction.php';
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
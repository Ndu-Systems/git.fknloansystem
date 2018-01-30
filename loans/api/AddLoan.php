 <?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));

if (isset($data->CustomerId) ){  
    $CustomerId = $data ->CustomerId;
    $LoanAmount =$data ->LoanAmount;
    $PaidLoan =$data ->PaidLoan;
    $Balance =$data ->Balance;
    $Interest =$data ->Interest;    
    $userId =$data ->userId;  
    $AmountPayable = $data -> AmountPayable;
	$MeansOfPayment = $data -> MeansOfPayment;
	$WOI = $data -> WOI;
	$Referrer = $data -> Referrer;
	$PaidInterest = $data -> PaidInterest;
	
    
        $sql = "INSERT INTO `loan`(`CustomerId`, `LoanAmount`, `AdditionalLoan`, `PaidLoan`,`PaidInterest`, `Balance`, `AmountPayable`, `MeansOfPayment`, `WOI`, `Interest`, `LoanDate`, `Status`, `Reciever`, `Referrer`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`)
               	VALUES ('$CustomerId','$LoanAmount','0','$PaidLoan','$PaidInterest','$Balance','$AmountPayable','$MeansOfPayment','$WOI','$Interest',NOW(),1,null,'$Referrer',NOW(),'$userId',NOW(),'$userId')";

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
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
    $Reciever = $data -> Reciever;
	$AdditionalLoan = 0;
	$LoanDate = $data-> LoanDate;
	$Description = $data -> Description;
	$LoanId = 0;
    
        $result = $conn->prepare( "INSERT INTO `loan`(`CustomerId`, `LoanAmount`, `AdditionalLoan`,`Description`, `PaidLoan`,`PaidInterest`, `Balance`, `AmountPayable`, `MeansOfPayment`, `WOI`, `Interest`, `LoanDate`, `Status`, `Reciever`, `Referrer`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`)
               	VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),?,NOW(),?)");

        if ($result->execute(array($CustomerId,$LoanAmount,$AdditionalLoan,$Description,$PaidLoan,$PaidInterest,$Balance,$AmountPayable,$MeansOfPayment,$WOI,$Interest,$LoanDate,1,$Reciever,$Referrer,$userId,$userId))) {
            $LoanId = $conn-> lastInsertId();
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
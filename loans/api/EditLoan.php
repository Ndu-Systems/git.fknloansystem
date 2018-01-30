<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));
   
    $CustomerId = $data ->CustomerId;
    $LoanId = $data ->LoanId;
    $LoanAmount =$data ->LoanAmount; 
    $Balance =$data ->Balance;
    $Interest =$data ->Interest;
	$PaidLoan = $data ->PaidLoan;
    $Status =$data ->Status; 
    $userId =$data ->userId;  
	$PaidInterest =$data ->PaidInterest;  
	$AdditionalLoan =$data ->AdditionalLoan;  
	$Reciever =$data ->Reciever; 
	$WOI = $data -> WOI;
	$Referrer = $data -> Referrer;

        $sql = " UPDATE `loan` SET 
				`CustomerId`='$CustomerId',
				`LoanAmount`='$LoanAmount',
				`PaidInterest`='$PaidInterest',
				`AdditionalLoan`='$AdditionalLoan',
				`Reciever`='$Reciever',
				`PaidLoan`='$PaidLoan',
				`Balance`=   '$Balance',							
				`Interest`='$Interest',				
				`Status`='$Status',	
				`WOI`='$WOI',	
				`Referrer`='$Referrer',					
				`ModifyDate`=NOW(),
				`ModifyUserId`='$userId' 
                WHERE `LoanId`=  '$LoanId'
               ";        
        
        if ($conn->query($sql) === TRUE) {
            echo 1;
            require 'EditTransaction.php';
        }
        else {
            //echo json_encode('failed');
            echo "Error: " . $sql . "<br>" . $conn->error;
        }    
?>

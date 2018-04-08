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
	$MeansOfPayment=$data ->MeansOfPayment;
	$WOI = $data -> WOI;
	$Referrer = $data -> Referrer;

        $result = $conn -> prepare( " UPDATE `loan` SET 
				`CustomerId`=?,
				`LoanAmount`=?,
				`PaidInterest`=?,
				`AdditionalLoan`=?,
				`Reciever`=?,
				 MeansOfPayment=?,
				`PaidLoan`=?,
				`Balance`=?,							
				`Interest`=?,				
				`Status`=?,	
				`WOI`=?,	
				`Referrer`=?,					
				`ModifyDate`=NOW(),
				`ModifyUserId`=? 
                WHERE `LoanId`=  ?
               ");        
        
        if ($result->execute(array($CustomerId,$LoanAmount,$PaidInterest,$AdditionalLoan,$Reciever,$MeansOfPayment,$PaidLoan,$Balance,$Interest,$Status,$WOI,$Referrer,$userId,$LoanId))) {
            echo 1;
            require 'EditTransaction.php';
        }
        else {
            //echo json_encode('failed');
            echo "Error: " . $sql . "<br>" . $conn->error;
        }    
?>

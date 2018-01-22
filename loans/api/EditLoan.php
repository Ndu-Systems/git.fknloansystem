<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));
   
    $CustomerId = $data ->CustomerId;
    $LoanId = $data ->LoanId;
    $LoanAmount =$data ->LoanAmount;
    $PaidAmount =$data ->PaidAmount;
    $Balance =$data ->Balance;
    $Interest =$data ->Interest;
    $LoanTerm =$data ->LoanTerm;
     $Status =$data ->Status; 
    $userId =$data ->userId;  

        $sql = " UPDATE `loan` SET 
				`CustomerId`='$CustomerId',
				`LoanAmount`='$LoanAmount',
				`PaidAmount`='$PaidAmount',
				`Balance`=   '$Balance',				
				`LoanTerm`='$LoanTerm',
				`Interest`='$Interest',				
				`Status`='$Status',				 
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

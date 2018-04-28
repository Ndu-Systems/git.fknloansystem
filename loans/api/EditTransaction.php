<?php
$Description      = $Description;
$LoanId           = $LoanId;
$TransactionDate  = date("l jS \of F Y h:i:s A") ;
$CreateDate       =date("l jS \of F Y h:i:s A") ;
$CreateUserId     = $userId;
$ModifyDate       = $LoanDate;
$ModifyUserId     = $userId;
$PayedAmount = $PaidLoan;
 $DefaultedInterest= $DefaultedInterest;

$result = $conn -> prepare( "
INSERT INTO  transaction (Description ,  LoanId ,LoanDate,  CustomerId ,  TransactionDate ,  LoanAmount ,  PayedAmount ,  Balance  ,  Interest , WOI,MeansOfPayment, Referrer, Reciever,AdditionalLoan,PaidInterest,DefaultedInterest, CreateDate ,  CreateUserId ,  ModifyDate ,  ModifyUserId )
VALUES
(?, ?, ?, ?, ?, ?,?, ?,?,?,?,?,?,?,?,?, now(), ?, ?, ?)");

  if ($result->execute(array($Description, $LoanId,$ModifyDate, $CustomerId, $TransactionDate,$LoanAmount, $PaidLoan, $Balance, $Interest,$WOI,$MeansOfPayment,$Referrer,$Reciever,$AdditionalLoan,$PaidInterest, $DefaultedInterest,$CreateUserId, $ModifyDate, $ModifyUserId))) {

        }
        else {
            //echo json_encode('failed');
            echo "Error: " . $result . "<br>" . $conn->error;
        }       
        
?>

 <?php
 

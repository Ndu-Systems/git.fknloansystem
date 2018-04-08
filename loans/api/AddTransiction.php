<?php
$Description      = 'New Load deposit';
// $LoanId           = $LoanId;
$TransactionDate  = date("l jS \of F Y h:i:s A") ;
$CreateDate       = date("l jS \of F Y h:i:s A") ;
$CreateUserId     = $userId;
$ModifyDate       = date("l jS \of F Y h:i:s A") ;
$ModifyUserId     = $userId;
$Referrer = $Referrer;
$Reciever = $Reciever;
$WOI = $WOI;
$MeansOfPayment = $MeansOfPayment;
$PayedAmount = $PaidLoan;
$AdditionalLoan = 0; 
$PaidInterest = $PaidInterest;


$result = $conn -> prepare( "
INSERT INTO  transaction (Description ,  LoanId ,  CustomerId ,  TransactionDate ,  LoanAmount ,  PayedAmount ,  Balance  ,  Interest , WOI,MeansOfPayment, Referrer, Reciever,AdditionalLoan,PaidInterest, CreateDate ,  CreateUserId ,  ModifyDate ,  ModifyUserId )
VALUES
(?, ?, ?, ?, ?, ?,?, ?,?,?,?,?,?,?, now(), ?, ?, ?)");

  if ($result->execute(array($Description, null, $CustomerId, $TransactionDate,$LoanAmount, $PaidLoan, $Balance, $Interest,$WOI,$MeansOfPayment,$Referrer,$Reciever,$AdditionalLoan,$PaidInterest, $CreateUserId, $ModifyDate, $ModifyUserId))) {

        }
        else {
            //echo json_encode('failed');
            echo "Error: " . $result . "<br>" . $conn->error;
        }       
        
?>

 <?php

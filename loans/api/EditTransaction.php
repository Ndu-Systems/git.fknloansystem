<?php
$Description      = 'Loan Update Transaction';
$LoanId           = $LoanId;
$TransactionDate  = date("l jS \of F Y h:i:s A") ;
$CreateDate       =date("l jS \of F Y h:i:s A") ;
$CreateUserId     = $userId;
$ModifyDate       = date("l jS \of F Y h:i:s A") ;
$ModifyUserId     = $userId;
$PayedAmount = $PaidLoan;

$query_add_transiction = "
INSERT INTO  transaction (Description ,  LoanId ,  CustomerId ,  TransactionDate ,  LoanAmount ,  PayedAmount ,  Balance  ,  Interest , WOI,MeansOfPayment, Referrer, Reciever, AdditionalLoan,PaidInterest, CreateDate ,  CreateUserId ,  ModifyDate ,  ModifyUserId )
VALUES
('$Description', null, $CustomerId, '$TransactionDate', '$LoanAmount', '$PaidLoan', '$Balance', '$Interest','$WOI','$MeansOfPayment','$Referrer','$Reciever','$AdditionalLoan','$PaidInterest', now(), '$CreateUserId', '$ModifyDate', '$ModifyUserId')
";

  if ($conn->query($query_add_transiction) === TRUE) {
		
        }
        else {
            //echo json_encode('failed');
            echo "Error: " . $query_add_transiction . "<br>" . $conn->error;
        }       
        
?>

 <?php
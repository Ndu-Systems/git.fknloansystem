<?php
$Description      = 'New Load deposit';
$LoanId           = 100;
$TransactionDate  = date("l jS \of F Y h:i:s A") ;
$CreateDate       =date("l jS \of F Y h:i:s A") ;
$CreateUserId     = $userId;
$ModifyDate       = date("l jS \of F Y h:i:s A") ;
$ModifyUserId     = $userId;
$PayedAmount = $PaidAmount;

$query_add_transiction = "
INSERT INTO  transaction (Description ,  LoanId ,  CustomerId ,  TransactionDate ,  LoanAmount ,  PayedAmount ,  Balance ,  LoanTerm ,  Interest ,  CreateDate ,  CreateUserId ,  ModifyDate ,  ModifyUserId )
VALUES
('$Description', '$LoanId', $CustomerId, '$TransactionDate', '$LoanAmount', '$PayedAmount', '$Balance', '$LoanTerm', '$Interest', '$CreateDate', '$CreateUserId', '$ModifyDate', '$ModifyUserId')
";

  if ($conn->query($query_add_transiction) === TRUE) {
		
        }
        else {
            //echo json_encode('failed');
            echo "Error: " . $query_add_transiction . "<br>" . $conn->error;
        }       
        
?>

 <?php

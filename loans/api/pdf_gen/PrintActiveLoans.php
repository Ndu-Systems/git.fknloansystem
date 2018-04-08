<?php
require('fpdf2.php');
require('main.php');
require('../conn.php');

 
//data 
$pdf = new PDF();
// First page
$pdf->AddPage();
// add logo
// Insert a logo in the top-left corner at 300 dpi
$pdf->Image('logo.PNG',330,1,-450); 

$pdf->SetFont('Arial','',20);
 
$pdf->Write(50,"Active Loans in The System");
$pdf->Write(35,"\n");

$Totalsql="";

if(isset($_GET['datepickerFrom'])){
    $datepickerFrom = $_GET['datepickerFrom'];
    $datepickerTo = $_GET['datepickerTo'];
     $Totalsql = "SELECT SUM(loan.LoanAmount) AS AmountLoaned, SUM(loan.Interest) AS InterestOnLoan, SUM(loan.PaidLoan) AS LoanPaid, SUM(loan.PaidInterest) AS InterestPaid , SUM(loan.AdditionalLoan) AS AddedLoan , SUM(loan.PaidLoan + loan.PaidInterest +  loan.AdditionalLoan) AS Profit 
            FROM `loan` INNER JOIN customer on loan.CustomerId = customer.CustomerId 
            WHERE loan.Status = 1 AND loan.CreateDate >= '$datepickerFrom' and loan.CreateDate<= '$datepickerTo'";
}
else{
         $Totalsql = "SELECT SUM(loan.LoanAmount) AS AmountLoaned, SUM(loan.Interest) AS InterestOnLoan, SUM(loan.PaidLoan) AS LoanPaid, SUM(loan.PaidInterest) AS InterestPaid , SUM(loan.AdditionalLoan) AS AddedLoan , SUM(loan.PaidLoan + loan.PaidInterest +  loan.AdditionalLoan) AS Profit 
                        FROM `loan` INNER JOIN customer on loan.CustomerId = customer.CustomerId 
                        WHERE loan.Status = 1";
}

//$pdf->Write(50,"Expected Profits from Active Loans in The System");
//$pdf->Write(35,"\n");
//$result = $conn->query($Totalsql);
//if ($result->num_rows > 0) {
//    while($row = $result->fetch_assoc()) {
//        $pdf->Write(5,"Loaned Amount   :  ".$row['AmountLoaned']);
//        $pdf->Ln();
//        $pdf->Ln();
//        $pdf->Write(5,"Interest On Loans  :  ".$row['InterestOnLoan']);
//        $pdf->Ln();
//        $pdf->Ln();
//        $pdf->Write(5,"Profit From Loans  :  ".$row['Profit']);
//        $pdf->Ln();
//        $pdf->Ln();
//         $pdf->Write(5,"Paid Interest  :  ".$row['InterestPaid']);
//        $pdf->Ln();
//        $pdf->Ln();
//         $pdf->Write(5,"Paid Loans  :  ".$row['LoanPaid']);
//        $pdf->Ln();
//        $pdf->Ln();
//    }
//}
 
//get db data
$pdf->SetFont('Arial','',11);
$sql="";
if(isset($_GET['datepickerFrom'])){
    $datepickerFrom = $_GET['datepickerFrom'];
    $datepickerTo = $_GET['datepickerTo'];
     $sql = "SELECT * FROM `loan` 
             INNER JOIN customer on loan.CustomerId = customer.CustomerId
             WHERE loan.Status = 1 AND loan.CreateDate >= '$datepickerFrom' and loan.CreateDate<= '$datepickerTo'";
}
else{
         $sql = "SELECT * FROM `loan` 
                 INNER JOIN customer on loan.CustomerId = customer.CustomerId
                 WHERE loan.Status = 1";

}
$pdf->SetFont('Arial','B',16);
 // Header columns 
$pdf->Cell(50,20,'Name',1,0,'C'); 
$pdf->Cell(50,20,'Surname',1,0,'C'); 
$pdf->Cell(45,20,'CellNumber',1,0,'C');
$pdf->Cell(20,20,'LoanId',1,0,'C');
$pdf->Cell(40,20,'LoanAmount',1,0,'C');
$pdf->Cell(40,20,'Balance',1,0,'C');
$pdf->Cell(40,20,'Reciever',1,0,'C');
$pdf->Cell(40,20,'Referrer',1,0,'C');
$pdf->Cell(50,20,'LoanDate',1,1,'C');
// End header columns
 
$pdf->SetFont('Arial','',14);
$fill=false;

foreach ($conn->query($sql) as $row) {
//$pdf->Cell($width_cell[0],40,$row['Description'],1,0); 
//$pdf->Cell($width_cell[1],40,$row['LoanAmount'],1,1); 
$pdf->Cell(50,10,$row['FirstName'],1,0,'C'); 
$pdf->Cell(50,10,$row['LastName'],1,0,'C'); 
$pdf->Cell(45,10,$row['CellNumber'],1,0,'C'); 
$pdf->Cell(20,10,$row['LoanId'],1,0,'C'); 
$pdf->Cell(40,10,$row['LoanAmount'],1,0,'C');
$pdf->Cell(40,10,$row['Balance'],1,0,'C');
$pdf->Cell(40,10,$row['Reciever'],1,0,'C');
$pdf->Cell(40,10,$row['Referrer'],1,0,'C');
$pdf->Cell(50,10,$row['LoanDate'],1,1,'C');
$fill = !$fill; // to give alternate background fill  color to rows
}
$pdf->Output(); 
?>
<?php
require('fpdf.php');
require('main.php');
require('../conn.php');

if(isset($_GET['id'])){
//data
$id = $_GET['id'];
$name = $_GET['name'];
$pdf = new PDF();
// First page
$pdf->AddPage();
// add logo
// Insert a logo in the top-left corner at 300 dpi
$pdf->Image('logo.PNG',330,1,-450); 

$pdf->SetFont('Arial','',20);
$pdf->Write(50,"Client Number : ".$id);
$pdf->Write(15,"\n");
$pdf->Write(50,"Transictions for :".$name);
$pdf->Write(35,"\n");


//get db data
$pdf->SetFont('Arial','',11);
$sql="";
if(isset($_GET['datepickerFrom'])){
    $datepickerFrom = $_GET['datepickerFrom'];
    $datepickerTo = $_GET['datepickerTo'];
     $sql = "SELECT * FROM transaction WHERE CustomerId = $id and CreateDate >= '$datepickerFrom' and CreateDate<= '$datepickerTo'";

}else{
         $sql = "SELECT * FROM transaction WHERE CustomerId = $id";

}
$pdf->SetFont('Arial','B',16);
 // Header columns 
$pdf->Cell(50,20,'Description',1,0,'C'); 
$pdf->Cell(40,20,'LoanAmount',1,0,'C');
$pdf->Cell(45,20,'AdditionalLoan',1,0,'C');
$pdf->Cell(40,20,'PayedAmount',1,0,'C');
$pdf->Cell(40,20,'PaidInterest',1,0,'C');
$pdf->Cell(40,20,'Balance',1,0,'C');
$pdf->Cell(20,20,'WOI',1,0,'C');
$pdf->Cell(30,20,'Interest',1,0,'C');
$pdf->Cell(50,20,'Reciever',1,0,'C');
$pdf->Cell(50,20,'Referrer',1,1,'C');
// End header columns
 
$pdf->SetFont('Arial','',14);
$fill=false;

foreach ($conn->query($sql) as $row) {
//$pdf->Cell($width_cell[0],40,$row['Description'],1,0); 
//$pdf->Cell($width_cell[1],40,$row['LoanAmount'],1,1); 
$pdf->Cell(50,10,$row['Description'],1,0,'C'); 
$pdf->Cell(40,10,$row['LoanAmount'],1,0,'C'); 
$pdf->Cell(45,10,$row['AdditionalLoan'],1,0,'C'); 
$pdf->Cell(40,10,$row['PayedAmount'],1,0,'C'); 
$pdf->Cell(40,10,$row['PaidInterest'],1,0,'C');
$pdf->Cell(40,10,$row['Balance'],1,0,'C');
$pdf->Cell(20,10,$row['WOI'],1,0,'C');
$pdf->Cell(30,10,$row['Interest'],1,0,'C');
$pdf->Cell(50,10,$row['Reciever'],1,0,'C');
$pdf->Cell(50,10,$row['Referrer'],1,1,'C');

$fill = !$fill; // to give alternate background fill  color to rows
}
$pdf->Output();
}else{
	echo "Please select the user!";
}
?>
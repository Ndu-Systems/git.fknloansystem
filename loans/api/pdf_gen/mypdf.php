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
$pdf->SetFont('Arial','',20);
$pdf->Write(5,"Transictions for ".$name);
$pdf->Write(5,"\n");
$pdf->Write(5,"\n");


//get db data
$pdf->SetFont('Arial','',11);
 $sql = "SELECT * FROM transaction WHERE 1";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
$pdf->Write(5,"------------------".$row['TransactionDate']."-----------------------------------------");
$pdf->Ln();
$pdf->Write(5,"Description  :  ".$row['Description']);
$pdf->Ln();
$pdf->Write(5,"Loan Amount  :  R".$row['LoanAmount']);
$pdf->Ln();
$pdf->Write(5,"Loan Balance  :  R".$row['Balance']);
$pdf->Ln();
$pdf->Write(5,"--------------------------------------------------------------------------------------------------------------------");
$pdf->Ln();
	}
}



$pdf->Write(5,"\n");
// Second page
//$pdf->AddPage();

//$pdf->Image('logo.png',10,12,30,0,'','http://www.fpdf.org');
//$pdf->SetLeftMargin(45);
//$pdf->SetFontSize(14);
$pdf->Output();
}else{
	echo "Please select the user!";
}
?>
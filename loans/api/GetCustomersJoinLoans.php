<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));

$table = $data->table;
$condition=$data->condition;
$rows = array();
 $sql = "SELECT loan.Balance, customer.FirstName,customer.CustomerId,customer.LastName,customer.CellNumber
FROM loan
INNER JOIN customer ON loan.CustomerId = customer.CustomerId WHERE customer.IsActive=1;";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
		$rows["data"][]= $row;
	}
}

echo json_encode($rows);
$conn->close();

?>

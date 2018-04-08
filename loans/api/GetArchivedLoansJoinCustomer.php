<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "conn.php";
$data = json_decode(file_get_contents("php://input"));

$table = $data->table;
$condition=$data->condition;
$rows = array();
 $result = $conn -> prepare( "SELECT loan.*, customer.EmailAddress,customer.FirstName,customer.LastName,customer.CellNumber
FROM loan
INNER JOIN customer ON loan.CustomerId = customer.CustomerId WHERE $condition;");
$result -> execute(array());
if ($result->rowCount() > 0) {
    while($row = $result->fetch(PDO::FETCH_OBJ)) {
		$rows["data"][]= $row;
	}
}
echo json_encode($rows);
//$conn->close();

?>

<?php

 $servername = "localhost";
 $username = "root";
 $password = "";
 $dbname = "fknloansdb";


// $servername = "127.0.0.1";
// $username = "ndusys0_fknloans";
// $password = "Harder01!";
// $dbname = "ndusys0_fknloansdb";


$conn = new mysqli($servername, $username, $password,$dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 


function SendEmail($sendTo,$title,$msg,$headers){
mail($sendTo,$title,$msg,$headers);
}
?>
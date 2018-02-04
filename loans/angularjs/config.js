var extention = ".php";

// Host
//var host = "http://ndu-systems.net/demo/fknloans_v3/api/";
//var host = "http://localhost/git.fknloansystem/loans/api/"; 
var host = "http://localhost/git.fknloans/loans/api/";   //Freedom

//PDF Transactions
var printTransictions = "http://localhost/git.fknloans/loans/api/pdf_gen/mypdf.php"  // Freedom
//var printTransictions = "http://localhost/git.fknloansystem/loans/api/pdf_gen/mypdf.php"

//var printTransictions = "http://ndu-systems.net/demo/fknloans_v3/api/pdf_gen/mypdf.php"

//PDF Historical Loan(s)
var printHistoricalLoans = "http://localhost/git.fknloans/loans/api/pdf_gen/archiveLoanPdf.php"
//var printHistoricalLoans = "http://ndu-systems.net/demo/fknloans_v3/api/pdf_gen/archiveLoanPdf.php"

//Pdf Active loans
var PrintActiveLoans = "http://localhost/git.fknloans/loans/api/pdf_gen/PrintActiveLoans.php"


//Pdf Closed loans
var PrintClosedLoans = "http://localhost/git.fknloans/loans/api/pdf_gen/PrintClosedLoans.php"


function GetApiUrl(serviceName) {

    var url = host + serviceName + extention;
    return url;
}
function GetHost(data) {
    return host + "" + data;
}
function getDate() {
    var today = new Date();
    var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var dateTime = date + ' ' + time;
    return dateTime;
}
// email tempates 

function WelcomeMessage() {
    var msg = "";
    return "";
}

function Confirm(heading, msg, callback) {
    
    $("#popup-heading").text(heading);
    $("#popup-paragraph").text(msg);
    $(".overlay").show();
    $(".popup").fadeIn("slow");

    $("#no").click(function () {
        $(".overlay").hide();
        $(".popup").hide();
        callback(false)
    });
    $("#yes").click(function () {
        $(".overlay").hide();
        $(".popup").hide();
        callback(true)
    });
  
}

function Load(){
	  $(".overlay").show();
	   $(".load").show();
}
function Done(){
	  $(".overlay").hide();
	   $(".load").hide();
}

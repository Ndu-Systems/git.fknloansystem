var extention = ".php";
<<<<<<< HEAD
//var host = "http://localhost/git.fknloans/loans/api/";
=======
//var host = "http://localhost:8080/git.fknloansystem/loans/api/";
var host = "http://localhost/git.fknloans/loans/api/";

>>>>>>> e4ddff2d6bdbd0e314c941abe5dbc8ee54916012
//var host = "http://ndu-systems.net/demo/fknloans/api/";
var host = "http://localhost/git.fknloansystem/loans/api/";

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

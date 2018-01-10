app.controller('loanController', function ($http, $scope, $window, $route) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }

});
app.controller('addLoanController', function ($http, $scope, $window, $route) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
    $scope.reset = function () {
        $scope.message = undefined
        $route.reload();
    };

    $scope.CustomerId = localStorage.getItem("CustomerId");
    $scope.FirstName = localStorage.getItem("FirstName");
    $scope.LastName = localStorage.getItem("LastName");
    $scope.CellNumber = localStorage.getItem("CellNumber");
    $scope.IdNumber = localStorage.getItem("IdNumber");
    $scope.EmailAddress = localStorage.getItem("EmailAddress");
    var userId = localStorage.getItem("userId");
    $scope.LoanAmount = 0;   
    $scope.Interest = 0;
    $scope.LoanTerm = 0;  
    var amountWithInterest = 0;
    var amount = 0;
    $scope.total = function () {
        amountWithInterest = $scope.LoanAmount * ($scope.Interest / 100);
        amount = $scope.LoanAmount + amountWithInterest;
        return amount;
    };
    $scope.addLoan = function () {
        Confirm("Confirm Loan", "Are you sure you want Grant Loan of R" + $scope.LoanAmount + " To " + $scope.FirstName + " " + $scope.LastName, function (result) {
            if (result) {
                var data = {
                    CustomerId: $scope.CustomerId,
                    LoanAmount: $scope.LoanAmount,
                    PaidAmount:0,
                    Balance: $scope.LoanAmount,
                    Interest: $scope.Interest,
                    LoanTerm  :$scope.LoanTerm,
                    userId    : userId
                };
                $http.post(GetApiUrl("AddLoan"), data).success(function (data, status) {
                    if (parseFloat(data) === 1) {                  
                        $window.location.href = "#viewCustomer";                      
                    }
                    else {
                        $scope.errorP = "Something went wrong, please try again.";
                    }
                })


            }
        });
    };

});


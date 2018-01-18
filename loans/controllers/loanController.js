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
        //Confirm("Confirm Loan", "Are you sure you want Grant Loan of R" + $scope.LoanAmount + " To " + $scope.FirstName + " " + $scope.LastName, function (result) {
        //    if (result) {
        //        var data = {
        //            CustomerId: $scope.CustomerId,
        //            LoanAmount: $scope.LoanAmount,
        //            PaidAmount:0,
        //            Balance: $scope.total(),
        //            Interest: $scope.Interest,
        //            LoanTerm: $scope.LoanTerm,
        //            AmountPayable: $scope.total(),
        //            userId    : userId
        //        };
        //        $http.post(GetApiUrl("AddLoan"), data).success(function (data, status) {
        //            if (parseFloat(data) === 1) {                  
        //                $window.location.href = "#viewCustomer";                      
        //            }
        //            else {
        //                $scope.errorP = "Something went wrong, please try again.";
        //            }
        //        })


        //    }
        //});
        var data = {
                        CustomerId: $scope.CustomerId,
                        LoanAmount: $scope.LoanAmount,
                        PaidAmount:0,
                        Balance: $scope.total(),
                        Interest: $scope.Interest,
                        LoanTerm: $scope.LoanTerm,
                        AmountPayable: $scope.total(),
                        userId    : userId
                    };
        $http.post(GetApiUrl("AddLoan"), data).success(function (data, status) {
            if (parseFloat(data) === 1) {
                $window.location.href = "#viewCustomer";
            }
            else {
                $scope.errorP = "Something went wrong, please try again.";
            }
        });

    };

});


app.controller('editLoanController', function ($http, $scope, $window, $route) {
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
    //Loan details
     $scope.AmountPayable = localStorage.getItem("AmountPayable");
     $scope.LoanAmount = localStorage.getItem("LoanAmount");
    $scope.Balance = localStorage.getItem("Balance");
    $scope.LoanTerm = localStorage.getItem("LoanTerm");
    var paid = 0;
    paid = localStorage.getItem("PaidAmount");
    $scope.Interest = localStorage.getItem("Interest");
    $scope.LoanDate = localStorage.getItem("LoanDate");
    $scope.Status = localStorage.getItem("Status");
    $scope.LoanId = localStorage.getItem("LoanId");
    $scope.PaidAmount = 0;
    var amount = 0;
    //Calculate Balance after amount paid.
    $scope.total = function () {
        amount = $scope.Balance - $scope.PaidAmount;
        return amount;
    };
    //Upload file
    $scope.filesChanged = function (eml) {
        $scope.errorP = undefined;
        $scope.success = undefined;
        $scope.files = eml.files;
        $scope.filename = $scope.files[0].name;
        alert($scope.filename);
        $scope.$apply();
    };
    $scope.SaveFile = function () {
        $scope.success = undefined;
        $scope.errorP = undefined;
        if ($scope.filename !== undefined) {
            var doc = "";
            var formData = new FormData();
            angular.forEach($scope.files, function (file) {
                formData.append('file', file);
                formData.append('name', file.name)
            });
            $http.post(GetApiUrl("upload"), formData, {
                transformRequest: angular.identity,
                headers: { 'Content-Type': undefined }
            })
            .success(function (resp) {
                var expectedDate = new Date();
                doc = GetHost(resp);
                //  alert(doc);               

                var data = {
                    Url: doc,
                    CustomerId: $scope.CustomerId,
                    LoanId: $scope.LoanId,
                    Description: "Proof Of Payment for "+$scope.FirstName+" "+$scope.LastName,
                    Status: 1,
                    userId: userId
                };
                $http.post(GetApiUrl("putDoc"), data).success(function (data, status) {
                    if (parseFloat(data) === 1) {
                        $scope.success = "Uploaded Successfully";
                        $scope.errorP = undefined;
                    }
                    else {
                        $scope.errorP = "Something went wrong, please try again.";
                    }
                })
            })
        }
        else {
            $scope.errorP = "Please Upload Profile Picture format: PNG,JPEG,JPG,GIF!";
        }
    };

    $scope.editLoan = function () {
        //Confirm("Update Loan", "You are about to pay R" + $scope.PaidAmount + " To " + $scope.FirstName + " " + $scope.LastName +"'s Loan", function (result) {
        //    if (result) {

        //        $scope.paidTotal = function () {
        //            var sum = paid + $scope.PaidAmount;
        //            return sum;
        //        };
        //        var data = {
        //            CustomerId: $scope.CustomerId,
        //            LoanAmount: $scope.LoanAmount,
        //            PaidAmount: $scope.paidTotal(),
        //            Balance: $scope.total(),
        //            LoanId:$scope.LoanId,
        //            Interest: $scope.Interest,
        //            LoanTerm: $scope.LoanTerm,
        //            Status: $scope.Status,
        //            userId: userId
        //        };
        //        $http.post(GetApiUrl("EditLoan"), data).success(function (data, status) {
        //            if (parseFloat(data) === 1) {
        //                $window.location.href = "#viewCustomer";
        //            }
        //            else {
        //                $scope.errorP = "Something went wrong, please try again.";
        //            }
        //        })


        //    }
        //});

                $scope.paidTotal = function () {
                    var sum = Number(paid || 0) + Number($scope.PaidAmount || 0);
                    return sum;
                };
                var data = {
                    CustomerId: $scope.CustomerId,
                    LoanAmount: $scope.LoanAmount,
                    PaidAmount: $scope.paidTotal(),
                    Balance: $scope.total(),
                    LoanId:$scope.LoanId,
                    Interest: $scope.Interest,
                    LoanTerm: $scope.LoanTerm,
                    Status: $scope.Status,
                    userId: userId
                };
                $http.post(GetApiUrl("EditLoan"), data).success(function (data, status) {
                    if (parseFloat(data) === 1) {
                        $window.location.href = "#viewCustomer";
                    }
                    else {
                        $scope.errorP = "Something went wrong, please try again.";
                    }
                });
    };


});

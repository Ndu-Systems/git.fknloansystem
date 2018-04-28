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
	//Loan Information
    $scope.LoanAmount = 0;  	
	$scope.MeansOfPayment ="";
	$scope.WOI ="";
	$scope.Referrer =""; 
    $scope.Interest = 0;
    $scope.LoanTerm = 0;
    $scope.Reciever = "";
    $scope.amountWithInterest = 0;
    var amount = 0;	
	$scope.PaidInterest = 0;
	$scope.validateInterest = undefined;

  	
	$scope.total = function () {
	    $scope.amountWithInterest = $scope.LoanAmount * ($scope.Interest / 100);
	    amount = $scope.LoanAmount + $scope.amountWithInterest;
        if ($scope.PaidInterest !== undefined) {
            if ($scope.PaidInterest !== 0) {
                amount = amount - $scope.PaidInterest;
            }
        }
        else {
            $scope.PaidInterest = 0;
        }
	    return amount;
	};
	

    $scope.addLoan = function () {
        //if ($scope.PaidInterest !== $scope.amountWithInterest) {
        //    $scope.validateInterest = "Please provide valid interest payment";
        //}
        //else {
            $scope.validateInterest = undefined;

            

            var data = {
                CustomerId: $scope.CustomerId,
                LoanAmount: $scope.LoanAmount,
                PaidLoan: 0,
                Referrer: $scope.Referrer,
                WOI: $scope.WOI,
                MeansOfPayment: $scope.MeansOfPayment,
                Balance: $scope.total(),
                Interest: $scope.Interest,
                AmountPayable: $scope.LoanAmount,
                userId: userId,
                PaidInterest: $scope.PaidInterest,
                Reciever: $scope.Reciever,
                LoanDate: $scope.LoanDate,
                Description: $scope.Description

            };
            $http.post(GetApiUrl("AddLoan"), data).success(function (data, status) {
                if (parseFloat(data) === 1) {
                    $window.location.href = "#viewCustomer";
                }
                else {
                    $scope.errorP = "Something went wrong, please try again.";
                }
            });
        //}   

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
    var paid = 0;
    paid = localStorage.getItem("PaidLoan");
    $scope.Interest = localStorage.getItem("Interest");
    $scope.LoanDate = localStorage.getItem("LoanDate");
    $scope.Status = localStorage.getItem("Status");
    $scope.LoanId = localStorage.getItem("LoanId");
	$scope.WOI = localStorage.getItem("WOI");  
    $scope.Referrer = localStorage.getItem("Referrer");
    $scope.MeansOfPayment = localStorage.getItem("MeansOfPayment");
    $scope.PaidLoan = 0;
	$scope.AdditionalLoan = 0;
	$scope.amountWithInterest = 0;
	$scope.defaultedInterest = 0;
    var amount = 0;
	var defaultInterest = 0;
	$scope.PaidInterest = 0;
    $scope.Reciever = localStorage.getItem("Reciever");
	var totalCount = 0;	
    //Calculate Balance after amount paid and Add Additional Loan
	$scope.totalBalance = function () { 
        $scope.amountWithInterest = $scope.AdditionalLoan * (25 / 100);
        amount = $scope.Balance - $scope.PaidLoan;
        if ($scope.AdditionalLoan !== 0) {
            amount += $scope.AdditionalLoan + $scope.amountWithInterest;
        }        
        if ($scope.PaidInterest !== 0) {
            amount = amount - Number($scope.PaidInterest || 0);
        }
        totalCount = amount + $scope.defaultedInterest;
        return totalCount;
	};
    //Upload file
    $scope.filesChanged = function (eml) {
        $scope.errorP = undefined;
        $scope.success = undefined;
        $scope.files = eml.files;
        $scope.filename = $scope.files[0].name;
        //alert($scope.filename);
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
	
  $scope.Deactivate = function () {
        Confirm("Confirm Deactivation", "Are you sure you want to Close this Loan for  " + $scope.FirstName, function (result) {
            if (result) {
                // Deactivate
                var data = {
                    LoanId:$scope.LoanId,
                    ModifyUserId: userId
                };              
                $http.post(GetApiUrl("DeactivateLoan"), data)
                .success(function (response, status) {
                    if (parseInt(response) === 1) {
                        $window.location.href = "#success";
                        localStorage.setItem("success", "Loan was closed successfully!")
                                             
                    }
                });

            }
        });
    }

    $scope.editLoan = function () {
                $scope.paidTotal = function () {
                    var sum = Number(paid || 0) + Number($scope.PaidLoan || 0);
                    return sum;
                };			
			 
                var data = {
                    CustomerId: $scope.CustomerId,
                    LoanAmount: Number($scope.AdditionalLoan || 0) + Number($scope.LoanAmount || 0),
                    PaidLoan: $scope.paidTotal(),
                    Balance: $scope.totalBalance(),
                    MeansOfPayment :  $scope.MeansOfPayment,
                    LoanId:$scope.LoanId,
                    Interest: $scope.Interest,           
                    Status: $scope.Status,
                    userId: userId,
					PaidInterest: $scope.PaidInterest,
					AdditionalLoan: $scope.AdditionalLoan ,
					Reciever: $scope.Reciever,
					Referrer:$scope.Referrer,
                    WOI: $scope.WOI,
                    LoanDate: $scope.LoanDate,
                    Description: $scope.Description,
                    DefaultedInterest: $scope.defaultedInterest
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

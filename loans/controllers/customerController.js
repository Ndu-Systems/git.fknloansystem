app.controller('customerController', function ($http, $scope, $window, $route) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
    $scope.message = undefined;
    var userId = localStorage.getItem("userId");
    $scope.reset = function () {
        $scope.message = undefined
        $route.reload();
    };

    $scope.addCustomer = function () {
        $scope.message = undefined;
        var data = {
            FirstName: $scope.firstname,
            LastName: $scope.surname,
            CellNumber: $scope.cellnumber,
            EmailAddress: $scope.email,
            IdNumber: $scope.idnumber,
            Location: $scope.location,
            Address: $scope.address,
            BankName: $scope.bankname,
            AccountNumber: $scope.accountnumber,
            BranchCode: $scope.branchcode,
            AccountType: $scope.accounttype,
            IsActive: 1,
            userId: userId
        };

        if (data.FirstName === undefined || data.LastName === undefined || data.CellNumber === undefined || data.EmailAddress === undefined || data.Location === undefined || data.Address === undefined || data.BankName === undefined || data.AccountNumber === undefined || data.BranchCode === undefined || data.AccountType === undefined)
        {
            $scope.message = "All fields must be field in";
        }
        else {
            $http.post(GetApiUrl("AddCustomer"), data)
              .success(function (response, status) {
                  if (parseFloat(response) === 1) {
                      $window.location.href = "#home";
                      $scope.message = undefined;
                  }
                  else {
                      $scope.message = "Something Went Wrong Please contact system administrator."
                  }
              });
        }
    }

});
app.controller('updateController', function ($http, $scope, $window) {

});
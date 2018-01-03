app.controller('homeController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
  
 
    //Get Customers 
    $scope.numCustomers = 0;
    var data = {
        table: "customer",
        condition: " IsActive = 1 "
    };
    $http.post(GetApiUrl("Get"), data)
    .success(function (response, status) {
        if (response.data !== undefined) {
            $scope.customers = response.data;
            var numC = 0;
            angular.forEach($scope.customers, function (item) {                
                numC++;             
            });
            $scope.numCustomers = numC;

            $scope.totalItems = $scope.customers.length;
            $scope.currentPage = 1;
            $scope.itemsPerPage = 5;

            $scope.$watch("currentPage", function () {
                setPagingData($scope.currentPage);
            });

            function setPagingData(page) {
                var pageData = $scope.customers.slice(
                    (page - 1) * $scope.itemsPerPage,
                    page * $scope.itemsPerPage);
                $scope.aCustomers = pageData;
            }
        }
    });

    //Selected Customer
    $scope.GetCustomer = function (cus) {
        localStorage.setItem("CustomerId", cus.CustomerId);
        localStorage.setItem("FirstName", cus.FirstName);
        localStorage.setItem("LastName", cus.LastName);
        localStorage.setItem("CellNumber", cus.CellNumber);

        localStorage.setItem("EmailAddress", cus.EmailAddress);
        localStorage.setItem("IdNumber", cus.IdNumber);
        localStorage.setItem("Location", cus.Location);
        localStorage.setItem("Address", cus.Address);

        localStorage.setItem("BankName", cus.BankName);
        localStorage.setItem("AccountNumber", cus.AccountNumber);
        localStorage.setItem("BranchCode", cus.BranchCode);
        localStorage.setItem("AccountType", cus.AccountType);

        localStorage.setItem("IsActive", cus.IsActive);
        localStorage.setItem("CreateDate", cus.CreateDate);
        localStorage.setItem("CreateUserId", cus.CreateUserId);
        localStorage.setItem("ModifyDate", cus.ModifyDate);

        localStorage.setItem("ModifyUserId", cus.ModifyUserId);
        $window.location.href = "#viewCustomer";
    }


    //Get Loans
    $scope.numLoans = 0;
    var data = {
        table: "loan",
        condition: " IsActive = 1 "
    };
    $http.post(GetApiUrl("Get"), data)
    .success(function (response, status) {
        if (response.data !== undefined) {
            $scope.loans = response.data;
            var numL = 0;
            angular.forEach($scope.loans, function (item) {
                numL++;
            });
            $scope.numLoans = numL;
        }
    });
});
app.controller('transactionController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
  
    $scope.CustomerId = localStorage.getItem("transictionCustomerNumber");
    //Get Customers    
    var data = {
        table: "customer",
        condition: " CustomerId = " + $scope.CustomerId
    };
    $http.post(GetApiUrl("Get"), data)
    .success(function (response, status) {
        if (response.data !== undefined) {
            //alert(response.data[0]);
            //Customer Details to Display
            $scope.FirstName = response.data[0].FirstName;
            $scope.LastName = response.data[0].LastName;
            $scope.CellNumber = response.data[0].CellNumber;
            $scope.EmailAddress = response.data[0].EmailAddress;
            $scope.IdNumber = response.data[0].IdNumber;
            $scope.Location = response.data[0].Location;
            $scope.Address = response.data[0].Address;
            $scope.BankName = response.data[0].BankName;
            $scope.AccountNumber = response.data[0].AccountNumber;
            $scope.BranchCode = response.data[0].BranchCode;
            $scope.AccountType = response.data[0].AccountType;
            $scope.IsActive = response.data[0].IsActive;
            $scope.url = response.data[0].url;
            $scope.status = "Not Alegible for Loan";
            if ($scope.IsActive === "1") {
                $scope.status = "Alegible for Loan";
            }
        }
    });

    //Get Transiction(s) For Customer
    var data = {
        table: "transaction",
        condition: "CustomerId = " + $scope.CustomerId
    };
    $http.post(GetApiUrl("Get"), data)
    .success(function (response, status) {
        if (response.data !== undefined) {
            $scope.Loans = response.data;

            var numL = 0;
            numL = $scope.Loans.length;
            $scope.numLoans = numL;
            $scope.totalItems = $scope.Loans.length;
            $scope.currentPage = 1;
            $scope.itemsPerPage = 5;

            $scope.$watch("currentPage", function () {
                setPagingData($scope.currentPage);
            });

            function setPagingData(page) {
                var pageData = $scope.Loans.slice(
                    (page - 1) * $scope.itemsPerPage,
                    page * $scope.itemsPerPage);
                $scope.aLoans = pageData;
            }
        }
    });

    $scope.Print = function () {
        var url = "http://localhost/git.fknloans/loans/api/pdf_gen/mypdf.php?id=" + $scope.CustomerId + "&name=" + $scope.FirstName;
        window.open(url, '_blank');
    }

});
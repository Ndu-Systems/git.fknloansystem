app.controller('configurationController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
    //Get Users
    $scope.usersNum = 0;
    var data = {
        table: "users",
        condition: " IsActive = 1 "
    };
    $http.post(GetApiUrl("Get"), data)
    .success(function (response, status) {
        if (response.data !== undefined) {
            $scope.users = response.data;
            $scope.usersNum = $scope.users.length;
        }
    });
});
app.controller('userController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
    var userId = localStorage.getItem("userId");
    //Get Users
    var data = {
        table: "users",
        condition: " IsActive = 1 "
    };
    $http.post(GetApiUrl("Get"), data)
    .success(function (response, status) {
        if (response.data !== undefined) {
            $scope.users = response.data;            
            $scope.totalItems = $scope.users.length;
            $scope.currentPage = 1;
            $scope.itemsPerPage = 5;

            $scope.$watch("currentPage", function () {
                setPagingData($scope.currentPage);
            });

            function setPagingData(page) {
                var pageData = $scope.users.slice(
                    (page - 1) * $scope.itemsPerPage,
                    page * $scope.itemsPerPage);
                $scope.aUsers = pageData;
            }
        }
    });

    //Add User
    $scope.reset = function () {
        $scope.message = undefined
        $route.reload();
    };
    $scope.addUser = function () {
        $scope.message = undefined;
        var data = {
            EmailAddress: $scope.EmailAddress,
            UserName: $scope.UserName,
            userId: userId,
            url: "http://localhost/fundakubona/api/uploads/profiles/5.png",

        };
        if (data.EmailAddress === undefined || data.UserName === undefined) {
            $scope.message = "All fields must be field in";
        }
        else {
            $http.post(GetApiUrl("AddUser"), data)
             .success(function (response, status) {
                 if (parseFloat(response) === 1) {
                     $window.location.href = "#systemusers";
                     $scope.message = undefined;
                 }
                 else {
                     $scope.message = "Something Went Wrong Please contact system administrator."
                 }
             });
        }
    }
});

app.controller('archivesController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
  
});
app.controller('archivedCustomersController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }

    //Get Archived Customers
    $scope.numCustomers = 0;
      var data = {
            table: "customer",
            condition: " IsActive = 0"
        };
        $http.post(GetApiUrl("Get"), data)
        .success(function (response, status) {
              if (response.data !== undefined) {
                $scope.customers = response.data;


                $scope.numCustomers = $scope.customers.length;

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

        localStorage.setItem("WorkAddress", cus.WorkAddress);
        localStorage.setItem("Department", cus.Department);
        localStorage.setItem("CallSign", cus.CallSign);
        localStorage.setItem("NOKName", cus.NOKName);
        localStorage.setItem("NOKAddress", cus.NOKAddress);
        localStorage.setItem("NOKContactNumber", cus.NOKContactNumber);


        localStorage.setItem("ModifyUserId", cus.ModifyUserId);
        localStorage.setItem("url", cus.url);
        $window.location.href = "#viewCustomer";
    }

    // get transictions 
    $scope.GetTransictions = function (cus) {
        $window.location.href = "#transictions";
        localStorage.setItem("transictionCustomerNumber", cus.CustomerId);

    }
});
app.controller('archivedLoansController', function ($http, $scope, $window, $timeout) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
    // date picker
    $(function () {
        $("#datepickerFrom").datepicker({
            dateFormat: "yy-mm-dd"
        });
    });

    $(function () {
        $("#datepickerTo").datepicker({
            dateFormat: "yy-mm-dd"
        });
    });
    // end date picker

    //Apply Filter
    $scope.Filter = function () {
        if ($scope.datepickerFrom !== undefined && $scope.datepickerTo !== undefined) {

            GetHistoricalLoans(true);
        }
    }

    //Show All
    $scope.ShowAll = function () {
        GetHistoricalLoans(false);
        $scope.datepickerFrom = undefined;
        $scope.datepickerTo = undefined;
    }

    GetHistoricalLoans(false);
    function GetHistoricalLoans(isFilter) {    
            Load();
            $timeout(function () {
                //Get Loan(s) For Customer
                var data = undefined;
                if(isFilter){
                    data = {
                        table: "loan",
                        condition: "loan.Status = 0 AND loan.CreateDate >= '" + $scope.datepickerFrom + "' and loan.CreateDate<= '" + $scope.datepickerTo + "'"
                    };
                }
                else{

                    data = {
                        table: "loan",
                        condition: "loan.Status = 0"
                    };
                }
              
                $http.post(GetApiUrl("GetArchivedLoansJoinCustomer"), data)
                .success(function (response, status) {
                    Done();
                    if (response.data !== undefined) {
                        $scope.message = undefined;
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
                    else {
                        $scope.aLoans = undefined;
                        $scope.Loans = [];
                        if ($scope.datepickerFrom !== undefined) {
                            $scope.message = `No transactions found between ${$scope.datepickerFrom}  and  ${$scope.datepickerTo}`;
                        } else {
                            $scope.message = "No transactions found ";
                        }
                    }
                });
            }, 2000)
    }
    $scope.Print = function () {

            if ($scope.datepickerFrom !== undefined && $scope.datepickerTo !== undefined) {
                var url = printHistoricalLoans + "&datepickerFrom=" + $scope.datepickerFrom + "&datepickerTo=" + $scope.datepickerTo;
                window.open(url, '_blank');
            } else {
                var url = printHistoricalLoans;
                window.open(url, '_blank');
            }
    }
});

app.controller('reportingController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }

});

app.controller('loanReportingController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
    // date picker
    $(function () {
        $("#datepickerFrom").datepicker({
            dateFormat: "yy-mm-dd"
        });
    });

    $(function () {
        $("#datepickerTo").datepicker({
            dateFormat: "yy-mm-dd"
        });
    });
    // end date picker

    //Apply Filter
    $scope.Filter = function () {
        if ($scope.datepickerFrom !== undefined && $scope.datepickerTo !== undefined) {

            GetHistoricalLoans(true);
        }
    }
    //Show All
    $scope.ShowAll = function () {
        GetHistoricalLoans(false);
        $scope.datepickerFrom = undefined;
        $scope.datepickerTo = undefined;
    }



    $scope.PrintActiveLoans = function () {
        if ($scope.datepickerFrom !== undefined && $scope.datepickerTo !== undefined) {
            var url = PrintActiveLoans + "&datepickerFrom=" + $scope.datepickerFrom + "&datepickerTo=" + $scope.datepickerTo;
            window.open(url, '_blank');
        } else {
            var url = PrintActiveLoans;
            window.open(url, '_blank');
        }
    }
    $scope.PrintClosedLoans = function () {
        if ($scope.datepickerFrom !== undefined && $scope.datepickerTo !== undefined) {
            var url = PrintClosedLoans + "&datepickerFrom=" + $scope.datepickerFrom + "&datepickerTo=" + $scope.datepickerTo;
            window.open(url, '_blank');
        } else {
            var url = PrintClosedLoans;
            window.open(url, '_blank');
        }
    }

});
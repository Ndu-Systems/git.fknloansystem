app.controller('homeController', function ($http, $scope, $window,$timeout) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
  
 
    //Get Customers
		$scope.numCustomers =0;
   Load();
 $timeout(function () {    
    var data = {
        table: "customer",
        condition: " IsActive = 1 "
    };
    $http.post(GetApiUrl("Get"), data)
    .success(function (response, status) {
		Done();
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
    }, 2000)   
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
        localStorage.setItem("EmployerName", cus.EmployerName);
        localStorage.setItem("EmployerCellNumber", cus.EmployerCellNumber);
        localStorage.setItem("StationedArea", cus.stationedarea);

        localStorage.setItem("NOKName", cus.NOKName);
		localStorage.setItem("NOKAddress", cus.NOKAddress);
        localStorage.setItem("NOKContactNumber", cus.NOKContactNumber);      
     
        localStorage.setItem("ModifyUserId", cus.ModifyUserId);
        localStorage.setItem("url", cus.url);
        $window.location.href = "#viewCustomer";
    }

    //Get Loans
    $scope.numLoans = 0;
    var data = {
        table: "loan",
        condition: " Status = 1 "
    };
    $http.post(GetApiUrl("Get"), data)
    .success(function (response, status) {
        if (response.data !== undefined) {
            $scope.loans = response.data;            
            $scope.numLoans = $scope.loans.length;
        }
    });

    //Get users
    $scope.numUsers = 0;
    var data2 = {
        table: "users",
        condition: " IsActive = 1 "
    };
    $http.post(GetApiUrl("Get"), data2)
    .success(function (response, status) {
        if (response.data !== undefined) {
            $scope.users = response.data;
            $scope.numUsers = $scope.users.length;
        }
    });
 // get transictions
 
    $scope.GetTransictions = function (cus) {
        $window.location.href = "#transictions";
        localStorage.setItem("transictionCustomerNumber", cus.CustomerId);

    }
});

app.controller('confirmController', function ($http, $scope, $window) {
	

   
});

app.controller('successController', function ($http, $scope, $window) {
    $scope.success = localStorage.getItem("success");
    $scope.Ok = function () {
        $window.location.href = "#home";
    };

});
app.controller('loanSuccessController', function ($http, $scope, $window) {
    $scope.success = localStorage.getItem("success");
    $scope.Ok = function () {
        $window.location.href = "#home";
    };

});
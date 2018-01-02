app.controller('homeController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
    $scope.numCustomers = 0;
    $scope.numLoans = 0;
    //Get Customers
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
        }
    });

    //Selected Customer



    //Get Loans
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
app.controller('configurationController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
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
            url: "http://localhost/git.fknloans/loans/api/uploads/profiles/5.png"
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
app.controller('loginController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") === "true") {
        $window.location.href = "#home";
    }
    var me = this;
    $scope.reset = function () {
        $scope.message = undefined
        $route.reload();
    };
    $scope.login = function () {
        var email = $scope.username;
        var password = $scope.password;

        var data = {
            email: email,
            password: password
        };
        if (data.email !== undefined && data.password !== undefined) {

            $http.post(GetApiUrl("Login"), data)
            .success(function (response, status) {
                if (response.length !== 0) {
                    var user = response.user[0];
                    localStorage.setItem("userId", user.UserId);
                    localStorage.setItem("surname", user.Username);
                    localStorage.setItem("isLoggedIn", true);
                    me.message = undefined;
                                     
                    var log = {
                        id : user.UserId
                    }
                    $http.post(GetApiUrl("logLogin"), log)
                    .success(function (response, status) {
                        if (response.length != 0) {
                            $window.location.href = "#home";
                        }
                    });               
                }
                else {
                    $scope.message = "Oops! Your username or password is incorrect please CHECK and try again.";
                }

            });
        }
        else {
            $scope.message = "Please make sure that all required fields are NOT empty"
        }
    };
});
app.controller('registerController', function ($http, $scope, $window) {

});
app.controller('logoutController', function ($http, $scope, $window) {
    localStorage.clear();
    $window.location.href = "#/";

});
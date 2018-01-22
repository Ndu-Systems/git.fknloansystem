app.controller('loginController', function ($http, $scope, $window, $route) {
    if (localStorage.getItem("isLoggedIn") === "true") {
        $window.location.href = "#home";
    }
   
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
        if (data.email !== undefined && data.password !== undefined && data.email !== "" && data.password !== "") {
            $http.post(GetApiUrl("Login"), data)
            .success(function (response, status) {
                if (response.length !== 0) {
                    var user = response.user[0];
                    localStorage.setItem("userId", user.UserId);
                    localStorage.setItem("usurname", user.UserName);
                    localStorage.setItem("uEmail", user.EmailAddress);
                    localStorage.setItem("uPassword", user.Password);
                    localStorage.setItem("uIsActive", user.IsActive);
                    localStorage.setItem("uRole", user.Role);                    
                    localStorage.setItem("uModifyUserId", user.ModifyUserId);
                    localStorage.setItem("uurl", user.url);
                    localStorage.setItem("isLoggedIn", true);
                    $scope.message = undefined;
                    if (user.Password !== "123456") {
                        var log = {
                            id: user.UserId
                        }
                        $http.post(GetApiUrl("logLogin"), log)
                        .success(function (response, status) {
                            if (response.length != 0) {
                                $window.location.href = "#home";
                            }
                        });
                    }
                    else {
                        localStorage.setItem("isLoggedIn", false);
                        $window.location.href = "#updatepassword"
                    }
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
app.controller('updatepasswordController', function ($http, $scope, $window) {
    $scope.submit = function () {
        $scope.message = undefined;
        var UserId = localStorage.getItem("userId");
        var Username = localStorage.getItem("usurname");
        var EmailAddress = localStorage.getItem("uEmail");
        var Password = localStorage.getItem("uPassword");
        var IsActive = localStorage.getItem("uIsActive");
        var Role = localStorage.getItem("uRole");
        var url = localStorage.getItem("uurl");

       
        if ($scope.Password === undefined) {
            $scope.message = "All fields must be field in";
        }
        else if ($scope.PasswordConfirm === undefined) {
            $scope.message = "All fields must be field in";
        }
        else if ($scope.Password !== $scope.PasswordConfirm) {
            $scope.message = "Password(s) do not Match please Check, And try again";
        }
        if ($scope.Password === $scope.PasswordConfirm) {

            var data = {
                UserId: UserId,
                UserName: Username,
                EmailAddress: EmailAddress,
                Password: $scope.Password,
                IsActive: IsActive,
                Role: Role,
                url: url
            };
            $http.post(GetApiUrl("EditUser"), data).success(function (data, status) {
                if (parseFloat(data) === 1) {
                    $window.location.href = "#/";
                    $scope.message = undefined;
                }
                else {
                    $scope.message = "Something Went Wrong, Please Try Again";
                }
            })
         }
        else {
            $scope.message = "Password entered is invalid, please retry!";

        }

    }
});
app.controller('logoutController', function ($http, $scope, $window) {
    localStorage.clear();
    $window.location.href = "#/";

});
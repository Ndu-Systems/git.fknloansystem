app.config(function ($routeProvider, $locationProvider) {
    $routeProvider
         .when('/', {
             templateUrl: 'pages/account/login.html',
             controller: 'loginController'
         })
        .when('/updatepassword', {
             templateUrl: 'pages/account/updatePassword.html',
             controller: 'updatepasswordController'
         })
        .when('/logout', {
             templateUrl: 'pages/account/logout.html',
             controller: 'logoutController'
         })
        .when('/home', {
             templateUrl: 'pages/home/index.html',
             controller: 'homeController'
        })         
    .when('/customers', {
        templateUrl: 'pages/customer/index.html',
        controller: 'homeController'
    })
    .when('/addCustomer', {
        templateUrl: 'pages/customer/addCustomer.html',
        controller: 'customerController'
    })
    .when('/viewCustomer', {
            templateUrl: 'pages/customer/details.html',
            controller: 'customerController'
    })
   .when('/editCustomer', {
            templateUrl: 'pages/customer/edit.html',
            controller: 'editController'
        })
    .when('/loans', {
        templateUrl: 'pages/home/loans.html',
        controller: 'loanController'
    })
    .when('/transactions', {
        templateUrl: 'pages/transaction/transactions.html',
        controller: 'homeController'
    })
    .when('/configurations', {
        templateUrl: 'pages/configuration/configurations.html',
        controller: 'configurationController'
    })
    .when('/systemusers', {
        templateUrl: 'pages/configuration/users.html',
        controller: 'userController'
    })
    .when('/adduser', {
        templateUrl: 'pages/configuration/AddUser.html',
        controller: 'userController'
    });
});

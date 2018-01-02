app.config(function ($routeProvider, $locationProvider) {
    $routeProvider
         .when('/', {
             templateUrl: 'pages/account/login.html',
             controller: 'loginController'
         }).when('/logout', {
             templateUrl: 'pages/account/logout.html',
             controller: 'logoutController'
         })
        .when('/home', {
             templateUrl: 'pages/home/index.html',
             controller: 'homeController'
        })         
    .when('/customers', {
        templateUrl: 'pages/home/customers.html',
        controller: 'homeController'
    })
    .when('/addCustomer', {
        templateUrl: 'pages/customer/addCustomer.html',
        controller: 'customerController'
    })
    .when('/loans', {
        templateUrl: 'pages/home/loans.html',
        controller: 'loanController'
    })
    .when('/transactions', {
        templateUrl: 'pages/transaction/transactions.html',
        controller: 'homeController'
    });
});

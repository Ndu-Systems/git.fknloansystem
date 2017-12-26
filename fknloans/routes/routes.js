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
             templateUrl: 'pages/home/home.html',
             controller: 'homeController'
        })
    .when('/customers', {
        templateUrl: 'pages/home/customers.html',
        controller: 'homeController'
    })
    .when('/loans', {
        templateUrl: 'pages/home/loans.html',
        controller: 'homeController'
    })
    .when('/payments', {
        templateUrl: 'pages/home/payments.html',
        controller: 'homeController'
    });
});

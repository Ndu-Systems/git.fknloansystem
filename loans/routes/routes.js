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
        templateUrl: 'pages/customer/customerList.html',
        controller: 'calculateCustomerController'
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
        .when('/addDocument', {
            templateUrl: 'pages/customer/addDocument.html',
            controller: 'customerController'
        })
    .when('/loans', {
        templateUrl: 'pages/loan/loans.html',
        controller: 'loanController'
    }).when('/editLoan', {
        templateUrl: 'pages/loan/editLoan.html',
        controller: 'editLoanController'
    })
   .when('/addLoan', {
       templateUrl: 'pages/loan/addLoan.html',
       controller: 'addLoanController'
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
    })
     .when('/success', {
         templateUrl: 'pages/home/success.html',
         controller: 'successController'
     })
    .when('/archives', {
        templateUrl: 'pages/home/archives.html',
        controller: 'archivesController'
    })
    .when('/reporting', {
        templateUrl: 'pages/home/reporting.html',
        controller: 'reportingController'
    })
     .when('/transictions', {
         templateUrl: 'pages/customer/transictions.html',
         controller: 'transactionController'
     })
});

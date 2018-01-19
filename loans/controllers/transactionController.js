﻿
 


app.controller('transactionController', function ($http, $scope, $window) {
    if (localStorage.getItem("isLoggedIn") !== "true") {
        $window.location.href = "#/";
    }
  // date picker
   $( function() {
   $( "#datepickerFrom" ).datepicker({
  dateFormat: "yy-mm-dd"
});
  });

  $( function() {
    $( "#datepickerTo" ).datepicker({
  dateFormat: "yy-mm-dd"
});
  });
  // end date picker
  
  $scope.Filter = function(){
	  if($scope.datepickerFrom !== undefined && $scope.datepickerTo !== undefined){
		  
		  GetTransictions(true);
	  }
  }
  
  $scope.ShowAll = function(){
	    GetTransictions(false);
		$scope.datepickerFrom = undefined;
		 $scope.datepickerTo = undefined;
  }
    $scope.CustomerId = localStorage.getItem("transictionCustomerNumber");
    //Get Customers    
    var data = {
        table: "customer",
        condition: " CustomerId = " + $scope.CustomerId
    };
    $http.post(GetApiUrl("Get"), data)
    .success(function (response, status) {
        if (response.data !== undefined) {
            //alert(response.data[0]);
            //Customer Details to Display
            $scope.FirstName = response.data[0].FirstName;
            $scope.LastName = response.data[0].LastName;
            $scope.CellNumber = response.data[0].CellNumber;
            $scope.EmailAddress = response.data[0].EmailAddress;
            $scope.IdNumber = response.data[0].IdNumber;
            $scope.Location = response.data[0].Location;
            $scope.Address = response.data[0].Address;
            $scope.BankName = response.data[0].BankName;
            $scope.AccountNumber = response.data[0].AccountNumber;
            $scope.BranchCode = response.data[0].BranchCode;
            $scope.AccountType = response.data[0].AccountType;
            $scope.IsActive = response.data[0].IsActive;
            $scope.url = response.data[0].url;
            $scope.status = "Not Alegible for Loan";
            if ($scope.IsActive === "1") {
                $scope.status = "Alegible for Loan";
            }
        }
    });

    //Get Transiction(s) For Customer
	GetTransictions(false);
   function GetTransictions(isFilter){
	   var data  = undefined;
	   if(isFilter){
		   data = {
       table: "transaction",
        condition: "CustomerId = " + $scope.CustomerId + " and CreateDate >= '" + $scope.datepickerFrom + "' and CreateDate<= '" + $scope.datepickerTo + "'"
	   }
	   }
	   
	   else{
	 data = {
        table: "transaction",
        condition: "CustomerId = " + $scope.CustomerId
	   }
		
		
    };
    $http.post(GetApiUrl("Get"), data)
    .success(function (response, status) {
        if (response.data !== undefined) {
            $scope.transictions = response.data;

            var numL = 0;
            numL = $scope.transictions.length;
            $scope.numLoans = numL;
            $scope.totalItems = $scope.transictions.length;
            $scope.currentPage = 1;
            $scope.itemsPerPage = 5;

            $scope.$watch("currentPage", function () {
                setPagingData($scope.currentPage);
            });

            function setPagingData(page) {
                var pageData = $scope.transictions.slice(
                    (page - 1) * $scope.itemsPerPage,
                    page * $scope.itemsPerPage);
                $scope.aLoans = pageData;
            }
        }
    });

	}
    $scope.Print = function () {
		if($scope.datepickerFrom !== undefined && $scope.datepickerTo !== undefined){
			 var url = printTransictions+"?id=" + $scope.CustomerId + "&name=" + $scope.FirstName + "&datepickerFrom="+$scope.datepickerFrom + "&datepickerTo="+$scope.datepickerTo;
        window.open(url, '_blank');
		}else{
			 var url = printTransictions+"?id=" + $scope.CustomerId + "&name=" + $scope.FirstName;
        window.open(url, '_blank');
		}
       
    }

});
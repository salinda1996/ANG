var app = angular.module("myModule", [])
           .controller("myController", function ($scope) {
               hide = false;
               London = false;
               London1 = false;
               London2= false;
               London3= false;
               var employees = [
                   { name: "A1", age: 25, city: "London" },
                   { name: "A2", age: 25, city: "London1" },
                   { name: "A3", age: 25, city: "London2" },
                   { name: "A4", age: 25, city: "London3" },
                   { name: "A5", age: 25, city: "London4" },
               ];
               $scope.employees = employees;
           });
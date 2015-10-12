console.log('This works');

angular.module('phApp', [])
  .controller('MainCtrl', function ($http, $scope) {
    $scope.formData = {};
    $http.get('/api/stakeholders')
      .success(function(data) {
        $scope.formData = data;
        console.log(data);
      })
      .error(function(data) {
        console.log('Error: ' + data);
      })
  })

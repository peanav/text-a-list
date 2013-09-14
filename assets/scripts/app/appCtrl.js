angular.module('app').controller('appCtrl', function($scope, $timeout, listService) {

  $scope.loadLists = function() {
    listService.getLists().success(function(data) {
      $scope.lists = data;
    });
  }

  $scope.loadItems = function() {
    if($scope.currentList) {
      listService.getItems($scope.currentList).success(function(data) {
        $scope.items = data;
      });
    }
  }

  $scope.setList = function(list) {
    $scope.currentList = list;
    $scope.loadItems();
  }

  $scope.current = function(list) {
    return $scope.currentList === list;
  }

  //Total hack of polling
  window.setInterval(function() { $scope.loadLists(); $scope.$apply(); }, 2000);
  window.setInterval(function() { $scope.loadItems(); $scope.$apply(); }, 2000);
  $scope.loadLists();
});

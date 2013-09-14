angular.module('app').factory('listService', function($http) {
  return {
    getLists: function() {
      return $http.get('/lists');
    },
    getItems: function(list) {
      return $http.get('/' + list + '/items');
    }
  };
});

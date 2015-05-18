/*global define */

'use strict';

define(function () {

  /* Controllers */

  var controllers = {};

  // this creates a controller for simple tables
  var createGenericTableView = function (name, httpCall) {
    var ctrl = function ($scope, $routeParams, httpApi) {
      $scope.updateView([name]);

      $scope.model = {
        gridOptions: {
          data: 'model.data'
        },
        data: []
      };

      httpApi[httpCall]($routeParams.dataset, $routeParams.group).then(function (evt) {
        $scope.model.data = evt.data.data;
      });
    };
    ctrl.$inject = ['$scope', '$routeParams', 'httpApi'];
    return ctrl
  };

  controllers.PredicateViewCtrl = createGenericTableView("predicates", "getPredicates");

  controllers.InversePredicateViewCtrl = createGenericTableView("inversePredicates", "getInversePredicates");

  controllers.AssociationRuleViewCtrl = createGenericTableView('associationRules', "getAssociationRules");

  controllers.SynonymViewCtrl = createGenericTableView('synonyms', "getSynonyms");

  controllers.FactGenerationViewCtrl = createGenericTableView('factGeneration', "getFactGeneration");

  controllers.SuggestionViewCtrl = createGenericTableView('suggestions',"getSuggestions");

  controllers.UniquenessViewCtrl = createGenericTableView('uniqueness', "getUniqueness");

  return controllers;

});
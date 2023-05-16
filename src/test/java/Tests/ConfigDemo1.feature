Feature: Config Demo

  Background: 
    * url baseURL

  Scenario: Config Demo 1
    Given print name

  Scenario: Config Demo 2
    Given path "/users?page=2"
    When method GET
    Then status 200
    And print response

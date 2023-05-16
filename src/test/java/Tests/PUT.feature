Feature: PUT API Demo

  Background: 
    * url 'https://reqres.in/api'

  Scenario: PUT Demo 1
    Given url 'https://reqres.in/api/users/2'
    And request {"name": "morpheus","job": "zion resident"}
    When method PUT
    Then status 200
    And print response

  # Assertion
  Scenario: PUT Demo 2
    Given url 'https://reqres.in/api/users/2'
    And request {"name": "morpheus","job": "zion resident"}
    When method PUT
    Then status 200
    And print response
    And match $ == {"name": "morpheus","job": "zion resident","updatedAt":"#ignore"}

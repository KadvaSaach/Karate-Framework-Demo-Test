Feature: POST API Demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/JSON'
    * def expectedOutput = read('response1.json')

  # Simple Post req
  Scenario: POST demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And print response

  # Post with Background
  Scenario: POST demo 2
    Given path '/users'
    And request {"name": "Ethan","job": "King"}
    When method POST
    Then status 201
    And print response

  # Post with Assertion
  Scenario: POST demo 3
    Given path '/users'
    And request {"name": "Awd","job": "King"}
    When method POST
    Then status 201
    And match response == {"createdAt": "#ignore","name": "Awd","id": "#string","job": "King"} # #ignore and #string is used to deal with the dynamic values
    And print response

  # Post with get response with file
  Scenario: POST demo 4
    Given path '/users'
    And request {"name": "Awd","job": "King"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

  # Read request body from file same dir
  Scenario: POST demo 5
    Given path '/users'
    And def reqBody = read('request1.json')
    And request reqBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

  # Read request body from file diffrent dir
  Scenario: POST demo 6
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath + '/src/test/java/data/request1.json'
    And print filePath
    And def requestBody = filePath
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

  # Read request body from file and changing specific value
  Scenario: POST demo 7
    Given path '/users'
    And def reqBody = read('request1.json')
    And set reqBody.job = 'Engineer'
    And request reqBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

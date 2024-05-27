Feature: auth api

Background: get auth token
    Given url 'https://dev-457931.okta.com/oauth2/aushd4c95QtFHsfWt4x6/v1/token'
    * def credentials = 
    """
    {
        scope: 'offline_access', grant_type: 'password',
        username: 'api-user4@iwt.net', password: 'b3z0nV0cLO',
        client_id: '0oahdhjkutaGcIK2M4x6'
    }
    """
    And form fields credentials
    When method post
    * def token = response.access_token

Scenario: authenticate and get airplane data
    Given url 'https://api.instantwebtools.net/v2/airlines/1'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    And match response.name == "Quatar Airways"

Scenario: Cookies
    Given url 'https://api.instantwebtools.net/v2/airlines'
    And cookies { value1: 'test', value2: '123' }
    When method get
    * print karate.prevRequest.headers.Cookie

Scenario: Run only on windows
    * print karate.os
    * def isWindows = karate.os.type == "windows"
    * if (!isWindows) karate.abort() 
    * if (!isWindows) karate.fail("This is not windows!")
    * print "I am running on Windows!"

Scenario: get java information
    * def javaInfo = karate.exec("java --version")
    * print javaInfo

Scenario: using sys properties
    * print "Hi, my name is", name

Scenario: Miles and kilometers
    * def kmToMiles = function(km) {return km / 1.6}
    * def milesToKm = function(miles) {return miles * 1.6}
    * assert kmToMiles(16) == 10
    * def miles = kmToMiles(90)

Scenario: Using JSON templates
    * def title = 'api test'
    * def pages = 250
    * def chapters = ['Core concepts', 'Setup']
    * def format = null
    * def book = 
    """
    {
        title: '#(title)',
        pages: #(pages),
        chapters: #(chapters),
        format: '##(format)'
    }
    """
    * print book
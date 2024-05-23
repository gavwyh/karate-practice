Feature: Posts API test
    Scenario: Checking user specific posts
        Given url "https://jsonplaceholder.typicode.com/posts?userId=1"
        When method get
        Then status 200
        And match response[0] contains {userId: 1}
        * print "RESPONSE: ", response.length
    
    Scenario: Creating a new post
        Given url "https://jsonplaceholder.typicode.com"
        And path "posts"
        And request { userId: 10, title: 'Hello', body: 'World'}
        When method post
        Then status 201
        And match responseType == 'json'
        And match response == { id: #number, userId: 10, title: 'Hello', body: 'World'}

    Scenario: Creating a variable
        * def myName = "test"
        * print "this is a", myName

    Scenario: Creating a new post with variable
        * def payload = { userId: 10, title: "Hello", body: "World" }
        * payload.id = "#number"

        Given url "https://jsonplaceholder.typicode.com"
        And path "posts"
        And request payload
        When method post
        Then status 201
        And match response == payload

    Scenario: Creating a new post with data table
        Given url "https://jsonplaceholder.typicode.com"
        And path "posts"
        * table payload 
            | userId |  title  |   text  | 
            | 10     | "Hello" | "World" |
        And request payload[0]
        When method post
        Then status 201
        And match responseType == "json"
        * payload[0].id = "#number"
        And match response == payload[0]

    Scenario: Creating a new post with a set
        Given url 'https://jsonplaceholder.typicode.com'
        And path 'posts'
        * set payload
        |path | |
        |userId| 10 |
        |title |'Hello'|
        |text |'World'|
        And request payload
        When method post
        Then status 201
        And match responseType == 'json'
        * payload.id = "#number"
        And match response == payload
        

        
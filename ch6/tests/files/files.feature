Feature: read from files
Scenario: read json
    * def json = read('../json-example.json')
    * assert json.name == "Karate"
    * assert json.inception == 2017

Scenario:
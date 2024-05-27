Feature: Using tags
@env=dev
Scenario: dev only
    * print "dev only"
@env=dev,prod
Scenario: dev and prod
    * print "dev and prod"
@envnot=dev
Scenario: Not in dev
    * print "not in dev"
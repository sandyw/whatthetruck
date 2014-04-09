Feature: Homepage
  As a user of Jaxtrucks
  When I come to the homepage
  I should see a Google map of local food trucks

  @javascript
  Scenario: Visit the home page and see a current truck
    Given that Baby's Badass Burgers is out in Jacksonville today
    When I go to jaxtrucks.com
    Then I should see the map of Jacksonville
    And I should see that truck in the list of trucks
    And I should see its full street address

  @javascript
  Scenario: Visit the home page when there are no trucks out
    When I go to jaxtrucks.com
    Then I should see the map of Jacksonville
    And I should see a message saying "There are no trucks out right now. :("

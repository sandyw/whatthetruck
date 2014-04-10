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

  @javascript
  @wip
  Scenario: View trucks out later today
    Given that it is 1pm
    And that Chew Chew will be at 400 Bay St from 4pm-2am today
    When I go to jaxtrucks.com
    Then I should see a message saying "There are no trucks out right now. :("
    And I should see that Chew Chew will be out from 4pm-2am today

  Scenario: View trucks out tomorrow

  Scenario: View trucks out tomorrow night

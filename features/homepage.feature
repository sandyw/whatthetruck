Feature: Homepage
  As a user of Jaxtrucks
  When I come to the homepage
  I should see a Google map of local food trucks

  @javascript
  Scenario: Visit the home page
    Given that Baby's Badass Burgers is out in Jacksonville today
    When I go to jaxtrucks.com
    Then I should see the map of Jacksonville
    And there should be a pin on the map at that truck's location

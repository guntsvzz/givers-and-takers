Feature: Taker Makes a Request
  As a Taker
  I want to sign up, sign in, and make a request
  So that I can receive donations.

  Scenario: Taker successfully makes a request
    Given I am signed up as a taker
    And I am signed in as a taker
    When I make a request titled "School Supplies" with quantity 10
    Then I should see "Request created successfully"

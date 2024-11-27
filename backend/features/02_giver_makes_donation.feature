Feature: Giver Makes a Donation
  As a Giver
  I want to sign up, sign in, look for requests, and donate
  So that I can help someone in need.

  Scenario: Giver successfully donates
    Given I am signed up as a giver
    And I am signed in as a giver
    When I visit the requests page
    And I donate 5 items to "School Supplies"
    Then I should see "Thank you for your donation!"

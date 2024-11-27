Feature: Taker Confirms Donation
  As a Taker
  I want to check the activities and confirm a donation
  So that the giver is notified of the confirmation.

  Scenario: Taker confirms a donation
    Given I am signed in as a taker for request
    When I check activities for my request "School Supplies"
    And I confirm the donation from the giver
    Then I should see "Donation confirmed successfully"

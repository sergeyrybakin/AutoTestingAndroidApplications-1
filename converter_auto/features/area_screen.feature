@area
Feature: User is able to convert area units

  Background:
    Given I click on "Got It" button
    And I land on "Area" screen

#  Scenario: User is able to dismiss help
#    Given I land on "Help" popup
#    When I click on "Got It" button
#    Then I land on "Area" screen


  Scenario: User is able to swap values
    Given I see "Sq Kilometre" in From header
    And I see "Sq Metre" in To header
    When I click on Swap button
    Then I see "Sq Metre" in From header
    And I see "Sq Kilometre" in To header

  Scenario Outline: User is able to convert default units
    Given I click on Clear button
    When I enter "<target>" to From field
    Then I get "<result>" in To field

    Examples:
    |target|result|
    |1|1000000|
    |12|12000000|
    |0.4|400000|

  Scenario: User is able to use soft keyboard to enter values
    Given I click on Clear button
    When I click on From button
    And I press "1.7" on soft keyboard
    Then I get "1700000" in To field

  Scenario:
    When I select "Hectare" from left column
    Then I see "Hectare" in From header
    And I get "10000" in To field

  @wip
  Scenario: User is able to see Help area
    Given I click on 3 vertical dots button
    And I land on FrameLayout screen
    When I select "Help" on FrameLayout screen
    Then I see "Help" on FrameLayout screen
    And I click on "Got It" button
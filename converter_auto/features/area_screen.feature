@area
Feature: User is able to convert area units

  Background:
    Given I click on "Закрыть" button
    And I land on "Площадь" screen

  Scenario: User is able to dismiss help
    Given I land on "Помощь" popup
    When I click on "Закрыть" button
    Then I land on "Площадь" screen

  Scenario: User is able to swap values
    Given I see "Кв. километр" in From header
    And I see "Кв. метр" in To header
    When I click on Swap button
    Then I see "Кв. метр" in From header
    And I see "Кв. километр" in To header

  @wip
  Scenario Outline: User is able to convert default units
    Given I click on Clear button
    When I enter "<target>" to From field
    Then I get "<result>" in To field

    Examples:
    |target|result|
#    |1|1.000.000|
#    |12|12.000.000|
    |0.4|400.000|

  Scenario: User is able to use soft keyboard to enter values
    Given I click on Clear button
    When I click on From button
    And I press "13" on soft keyboard
    Then I get "13.000.000" in To field

  Scenario:
    When I select "Гектар" from left column
    Then I see "Гектар" in From header
    And I get "10.000" in To field

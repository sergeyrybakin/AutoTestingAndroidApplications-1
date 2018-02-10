@ex4
Feature: User can select any existing measurement unit and convert the values using ultimate_converter.apk

  Background:
    Given I click on "Got It" button
    And I land on "Area" screen

  @wip
  Scenario Outline:
    When I swipe in the menu
    And I select "<measurement>" from menu
    And I click on "<target unit>" in left column
    And I click on "<result unit>" in right column
    And I click on Clear button
    And I press "<target amount>" on soft keyboard
    Then I get "<result amount>" in To field

    Examples:
    |measurement      |target unit|target amount|result unit    |result amount|
    |Cooking          |Litre      |0.5          |Teaspoon       |101.4421     |
    |Temperature      |Celsius    |-10.5        |Fahrenheit     |13.1         |
    |Length / Distance|Miles      |2            |Furlong        |16           |
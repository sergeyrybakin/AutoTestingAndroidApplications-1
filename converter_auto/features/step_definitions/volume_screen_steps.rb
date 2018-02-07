When(/^I swipe in the menu$/) do
  # swipe - ткнули пальцем, прижали и потянули
  action = Appium::TouchAction.new.swipe(start_x: 0.01, start_y: 0.5, end_x: 0.9, end_y: 0.5, duration: 500)
  action.perform
end

And(/^I see app menu$/) do
  find_element(id: "design_navigation_view").find_element(xpath:"//android.widget.CheckedTextView[@text='Площадь']")
  find_element(id: "design_navigation_view").find_element(xpath:"//android.widget.CheckedTextView[@text='Кулинария']")
  find_element(id: "design_navigation_view").find_element(xpath:"//android.widget.CheckedTextView[@text='Валюта']")
end

And(/^I select "([^"]*)" from menu$/) do |value|
  select_menu_item(value)
end

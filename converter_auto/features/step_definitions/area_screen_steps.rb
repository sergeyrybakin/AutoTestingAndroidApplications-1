Given(/^I land on "([^"]*)" popup$/) do |value|
  text("#{value}")
end

When(/^I click on "([^"]*)" button$/) do |value|
  find_element(id: "buttonPanel").find_element(xpath: "//android.widget.Button[@text='#{value}']").click
end

Then(/^I land on "([^"]*)" screen$/) do |value|
  actual_value = find_element(id: "toolbar").find_element(xpath: "//android.widget.TextView[@text='#{value}']").text
  if actual_value != value
    fail("Expected value is #{value}, but actual value is #{actual_value}")
  end
end

When(/^I click on Swap button$/) do
  find_element(id:"fab").click
end

Then(/^I see "([^"]*)" in From header$/) do |value|
  actual_value = find_element(id: "header_text_unit_from").text
  if actual_value != value
    fail("Expected value is #{value}, but actual value is #{actual_value}")
  end
end

And(/^I see "([^"]*)" in To header$/) do |value|
  actual_value = find_element(id: "header_text_unit_to").text
  if actual_value != value
    fail("Expected value is #{value}, but actual value is #{actual_value}")
  end
end

And(/^I click on Clear button$/) do
  button = find_element(id:"menu_clear")
  if button.enabled? != true
    fail("Button Clear should be enabled")
  end
  button.click
end

When(/^I enter "([^"]*)" to From field$/) do |value|
  find_element(id:"header_value_from").send_keys(value)
end

Then(/^I get "([^"]*)" in To field$/) do |value|
  actual_value = find_element(id: "header_value_to").text
  if actual_value != value
    fail("Expected value is #{value}, but actual value is #{actual_value}")
  end
end

When(/^I click on From button$/) do
  find_element(id:"header_value_from").click
end

And(/^I press "([^"]*)" on soft keyboard$/) do |value|
  digits = value.split("")
  digits.each do |key|
    if key == '.'
      press_keycode 158
    elsif key == '-'
      press_keycode 156
    else
      digit = Integer(key)
      press_keycode 7 + digit
    end
  end
end

When(/^I select "([^"]*)" from left column$/) do |value|
  find_element(id: "radio_group_from").find_element(xpath: "//android.widget.RadioButton[@text='#{value}']").click
end

Given(/^I click on 3 vertical dots button$/) do
  find_element(id: "toolbar").find_element(xpath: "//android.widget.ImageView").click
end

And(/^I land on FrameLayout screen$/) do
  listview = (find_element(xpath: "//android.widget.FrameLayout[1]").find_element(xpath: "//android.widget.ListView[1]"))
  if listview.enabled? != true
    fail("Expected FrameLayout is enabled")
  end
end

When(/^I select "([^"]*)" on FrameLayout screen$/) do |value|
  (find_element(xpath: "//android.widget.FrameLayout[1]").find_element(xpath: "//android.widget.ListView[1]").find_element(xpath: "//android.widget.TextView[@text='#{value}']")).click
end

Then (/^I see "([^"]*)" on FrameLayout screen$/) do |value|
  actual_value = find_element(id: "topPanel").find_element(xpath: "//android.widget.TextView[@text='#{value}']").text
  if actual_value != value
    fail("Expected value is #{value}, but actual value is #{actual_value}")
  end
end

And(/^I select "([^"]*)" from right column$/) do |value|
  find_element(id: "radio_group_to").find_element(xpath: "//android.widget.RadioButton[@text='#{value}']").click
end
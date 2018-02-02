Given(/^I land on "([^"]*)" popup$/) do |value|
  text("#{value}")
end

When(/^I click on "([^"]*)" button$/) do |value|
  find_element(id: "buttonPanel").find_element(xpath: "//android.widget.Button[@text='#{value}']").click
end

Then(/^I land on "([^"]*)" screen$/) do |value|
  find_element(id: "toolbar").find_element(xpath: "//android.widget.TextView[@text='#{value}']")
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
  find_element(id:"menu_clear").click
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
    if key != "."
      digit = Integer(key)
      press_keycode 7 + digit
    else
      press_keycode 158
    end
  end
end

When(/^I select "([^"]*)" from left column$/) do |value|
  find_element(id: "radio_group_from").find_element(xpath: "//android.widget.RadioButton[@text='#{value}']").click
end
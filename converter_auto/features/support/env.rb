require "appium_lib"

def caps
  {caps: {
      deviceName: "Name",
      platformName: "Android",
      app:(File.join(File.dirname(__FILE__),"ultimate_converter.apk")),
      appPackage: "com.physphil.android.unitconverterultimate",
      appActivity: "com.physphil.android.unitconverterultimate.MainActivity",
      newCommandTimeout: "3600"
      }
  }
end

Appium::Driver.new(caps,true)
Appium.promote_appium_methods Object

def select_menu_item(value)

  current_screen = get_source
  previous_screen = ""

  until (exists {find_element(id: "design_navigation_view").find_element(xpath:"//android.widget.CheckedTextView[@text='#{value}']")}) || (current_screen == previous_screen) do
    Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, end_x: 0.5, end_y: 0.2, duration: 500).perform
    previous_screen = current_screen
    current_screen = get_source
  end

  if exists {find_element(id: "design_navigation_view").find_element(xpath:"//android.widget.CheckedTextView[@text='#{value}']")}
    find_element(id: "design_navigation_view").find_element(xpath:"//android.widget.CheckedTextView[@text='#{value}']").click
  else
    fail("Element #{value} was not found in menu")
  end

end

def select_left_column_item(value)
  current_screen = get_source;
  previous_screen = "";

  until (exists {find_element(id: "radio_group_from").find_element(xpath:"//android.widget.RadioButton[@text='#{value}']")}) || (current_screen == previous_screen) do
    Appium::TouchAction.new.swipe(start_x: 0.2, start_y: 0.8, end_x: 0.2, end_y: 0.2, duration: 500).perform
    current_screen == previous_screen
    current_screen = get_source;
  end

  if exists {find_element(id: "radio_group_from").find_element(xpath:"//android.widget.RadioButton[@text='#{value}']")}
    find_element(id: "radio_group_from").find_element(xpath:"//android.widget.RadioButton[@text='#{value}']").click
  else
    fail("Element #{value} was not found in From column")
  end
end

def select_right_column_item(value)
  current_screen = get_source;
  previous_screen = "";

  until (exists {find_element(id: "radio_group_to").find_element(xpath:"//android.widget.RadioButton[@text='#{value}']")}) || (current_screen == previous_screen) do
      Appium::TouchAction.new.swipe(start_x: 0.7, start_y: 0.8, end_x: 0.7, end_y: 0.2, duration: 500).perform
      previous_screen = current_screen
      current_screen = get_source
  end

  if exists {find_element(id: "radio_group_to").find_element(xpath:"//android.widget.RadioButton[@text='#{value}']")}
    find_element(id: "radio_group_to").find_element(xpath:"//android.widget.RadioButton[@text='#{value}']").click
  elsif current_screen == previous_screen
    begin
      Appium::TouchAction.new.swipe(start_x: 0.7, start_y: 0.4, end_x: 0.7, end_y: 0.9, duration: 500).perform
      previous_screen = current_screen
      current_screen = get_source
    end while (!exists {find_element(id: "radio_group_to").find_element(xpath:"//android.widget.RadioButton[@text='#{value}']")}) || (current_screen == previous_screen)
  end

  if exists {find_element(id: "radio_group_to").find_element(xpath:"//android.widget.RadioButton[@text='#{value}']")}
    find_element(id: "radio_group_to").find_element(xpath:"//android.widget.RadioButton[@text='#{value}']").click
  else
    fail("Element #{value} was not found in To column")
  end
end
require "appium_lib"
require "appium_lib_core"
require "em/pure_ruby"
require "pry"
require "report_builder"
require_relative "screen_helper.rb"

World(ScreenHelper)

def caps
  { caps: {
    deviceName: "Anyname",
    platformName: "Android",
    app: (File.join(File.dirname(__FILE__), "app/PreciseUnitConversion.apk")),
    appPackage: "com.ba.universalconverter",
    appActivity: "MainConverterActivity",
    newCommandTimeout: "3600",
  } }
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

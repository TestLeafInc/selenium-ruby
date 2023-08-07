# spec_helper.rb
require 'selenium-webdriver'
require 'rspec'
require 'bundler'
# require 'rspec_html_reporter'


RSpec.configure do |config|
  #config.default_formatter = 'RspecHtmlFormatter'
  
  config.before(:each) do
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
        :platformName => "linux",
    )
    @driver = Selenium::WebDriver.for(:remote, :url => "http://20.244.6.182:4444/wd/hub", :capabilities => caps)
    @driver.navigate.to "http://leaftaps.com/opentaps/control/main"

    @driver.find_element(:id, "username").send_keys("demosalesManager")
    @driver.find_element(:id, "password").send_keys("crmsfa")
    @driver.find_element(:class, "decorativeSubmit").click

    @driver.find_element(:link_text, "CRM/SFA").click
    @driver.find_element(:link_text, "Leads").click
    @driver.save_screenshot("Login.png")

  end

  config.after(:each) do
    @driver.quit
  end
end




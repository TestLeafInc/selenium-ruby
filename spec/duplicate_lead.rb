require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require File.join(__dir__, 'spec_helper')

describe "LeafTaps Duplicate Lead" do

    it "Login and Duplicate an existing lead" do 
        @driver.find_element(:link_text, "Find Leads").click
        @driver.find_element(:xpath, "//span[text()='Phone']").click
        @driver.find_element(:xpath, "//input[@name='phoneNumber']").send_keys("99")
        @driver.find_element(:xpath, "//button[text()='Find Leads']").click
        sleep 2
        @driver.find_element(:xpath, "//div[@class='x-grid3-cell-inner x-grid3-col-partyId']/a").click
        @driver.find_element(:link_text, "Duplicate Lead").click
        @driver.find_element(:name, "submitButton").click
    end
end
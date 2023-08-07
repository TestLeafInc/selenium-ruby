require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require File.join(__dir__, 'spec_helper')

describe "LeafTaps Delete Lead" do

    it "Login and delete an existing lead" do 
        @driver.find_element(:link_text, "Find Leads").click
        @driver.find_element(:xpath, "//span[text()='Phone']").click
        @driver.find_element(:xpath, "//input[@name='phoneNumber']").send_keys("99")
        @driver.find_element(:xpath, "//button[text()='Find Leads']").click
        sleep 2
        leadID = @driver.find_element(:xpath, "//div[@class='x-grid3-cell-inner x-grid3-col-partyId']/a").text
        @driver.find_element(:xpath, "//div[@class='x-grid3-cell-inner x-grid3-col-partyId']/a").click
        @driver.find_element(:link_text, "Delete").click
        @driver.find_element(:link_text, "Find Leads").click
        @driver.find_element(:xpath, "//input[@name='id']").send_keys(leadID)
        @driver.find_element(:xpath, "//button[text()='Find Leads']").click
        text = @driver.find_element(:class, "x-paging-info").text
        if text == "No records to display"
          puts "The records were not displayed as expected"
        else
          puts "The records displayed and the tests failed"
        end
        
        
    end
end

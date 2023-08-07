require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require File.join(__dir__, 'spec_helper')

describe "LeafTaps Edit Lead" do
   
    it "Login and edit an existing lead" do 
        @driver.find_element(:link_text, "Find Leads").click
        @driver.find_element(:xpath, "//span[text()='Phone']").click
        @driver.find_element(:xpath, "//input[@name='phoneNumber']").send_keys("99")
        @driver.find_element(:xpath, "//button[text()='Find Leads']").click
        sleep 5
        @driver.find_element(:xpath, "//div[@class='x-grid3-cell-inner x-grid3-col-partyId']/a").click
        @driver.find_element(:link_text, "Edit").click
        @driver.find_element(:id, "updateLeadForm_companyName").send_keys("company") # replace "company" with your actual company name
        @driver.find_element(:name, "submitButton").click
        
    end
end

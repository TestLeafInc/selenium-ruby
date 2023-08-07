require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require File.join(__dir__, 'spec_helper') # adjust this as necessary based on your directory structure

describe "LeafTaps Create Lead" do

    it "Login and Create a new lead" do 
        @driver.find_element(:link_text, "Create Lead").click
        @driver.find_element(:id, "createLeadForm_companyName").send_keys("TestLeaf")
        @driver.find_element(:id, "createLeadForm_firstName").send_keys("Babu")
        @driver.find_element(:id, "createLeadForm_lastName").send_keys("M")
        @driver.find_element(:id, "createLeadForm_primaryPhoneNumber").send_keys("04445544246")
        @driver.find_element(:name, "submitButton").click
    end
end

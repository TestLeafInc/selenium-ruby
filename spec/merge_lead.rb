require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require File.join(__dir__, 'spec_helper')

describe "LeafTaps Merge Leads" do
   
    it "Login and Merge 2 leads" do 
        @driver.find_element(:link_text, "Merge Leads").click
        @driver.find_element(:xpath, "//img[@alt='Lookup']").click

        all_windows = @driver.window_handles
        @driver.switch_to.window(all_windows[1])
        @driver.find_element(:xpath, "//input[@name='firstName']").send_keys("Babu")
        @driver.find_element(:xpath, "//button[text()='Find Leads']").click

        sleep 2

        @driver.find_element(:xpath, "(//div[@class='x-grid3-cell-inner x-grid3-col-partyId']/a)[1]").text
        @driver.find_element(:xpath, "(//div[@class='x-grid3-cell-inner x-grid3-col-partyId']/a)[1]").click
        @driver.switch_to.window(all_windows[0])
        @driver.save_screenshot("merge 1.png")

        @driver.find_element(:xpath, "(//img[@alt='Lookup'])[2]").click

        all_windows2 = @driver.window_handles
        @driver.switch_to.window(all_windows2[1])
        @driver.find_element(:xpath, "//input[@name='firstName']").send_keys("Hari")
        @driver.find_element(:xpath, "//button[text()='Find Leads']").click

        sleep 2

        leadID = @driver.find_element(:xpath, "//div[@class='x-grid3-cell-inner x-grid3-col-partyId']/a").click
        @driver.switch_to.window(all_windows2[0])
        @driver.save_screenshot("merge 2.png")

        @driver.find_element(:xpath, "//a[text()='Merge']").click
        @driver.switch_to.alert.accept
        @driver.save_screenshot("merge 3.png")

        @driver.find_element(:link_text, "Find Leads").click
        @driver.find_element(:xpath, "//input[@name='id']").send_keys(leadID)
        @driver.find_element(:xpath, "//button[text()='Find Leads']").click
        @driver.save_screenshot("merge 4.png")

        sleep 5

        text = @driver.find_element(:class, "x-paging-info").text

        if text == "No records to display"
            puts "The records were not displayed as expected"
        else
            puts "The records displayed and the tests failed"
        end
    end
end

require 'spec_helper'
require 'watir'

describe "Logged in user posting a quote" do 

	before(:all) do 
		@browser = Watir:: Browser.new :firefox
		@browser.goto url("/login")
	end

	after(:all) do 
		@browser.close
	end 

	it "Logging in" do
		text = @browser.text_field :id, "signup_email"
		text.set "aoloyede@testingcircle.com"

		pw = @browser.text_field :id, "signup_password"
		pw.set "testacademy"

		@browser.button(:id, "signup_forms_submit").click
	end 

	it "Posting quote" do 
		@browser.a(:id, "new_post_label_quote").click 

		a = @browser.text_field :id, "post_one"
		a.set "I don't know you but I feel you"

		@browser.button(:class, "create_post_button chrome blue txt ").click 

		@browser.div(:class, "post_wrapper").wait_until_present

    	expect(@browser.text.include? "don't know you but I feel you")
    end 
end 





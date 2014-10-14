require 'spec_helper'
require 'watir'
require 'pry'

describe "Logged in user posting text" do 

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



	it "Posting text" do 	
		@browser.span(:class,  "new_post_label_text").click

			#wait = Watir::WebDriver::Wait.new(:timeout => 5)
 
		@browser.send_keys("This is just another text to signify another tumblr post")

		a = @browser.text_field :id, "post_one"
		a.set "Another tumblr  post"

		@browser.div(:id, "create_post").click 

		@browser.div(:class , "post_wrapper").wait_until_present
	end
end 
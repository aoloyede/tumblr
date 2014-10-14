require 'spec_helper'
require 'watir'

describe "Logged in user posting link" do 

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

	it "Posting link" do 
		@browser.a(:id, "new_post_label_link").click 

		l = @browser.text_field :id, "post_two"
		l.set "https://soundcloud.com/allstar-365/the-official-allstarhouseparty"

		title = @browser.text_field :id, "post_one"
		title.set "allstar 365 aka Kenny"

		@browser.button(:class, "create_post_button chrome blue txt ").click 
	end 
end
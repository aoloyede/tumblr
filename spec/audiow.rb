require 'spec_helper'
require 'watir'


describe "Logged in user posting audio" do 

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
		expect(@browser.url == "https://www.tumblr.com/dashboard")
	end 

	it "Posting audio" do 
		@browser.a(:id, "new_post_label_audio").click 

		at = @browser.text_field :id, "audio_search_field"
		at.set "Lil Kesh - Shoki"

		@browser.a(:id, "tab_audio_upload").click

		@browser.a(:id, "tab_audio_external").click 

		url = @browser.text_field :id, "post_three"
		url.set "http://www.youtube.com/watch?v=f34zcceVu7U"

		@browser.button(:class, "create_post_button chrome blue txt ").click 
	end 
end 


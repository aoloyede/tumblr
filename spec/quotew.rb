require 'spec_helper'
require 'watir'
require 'pry'

@browser = Watir:: Browser.new :firefox

@browser.goto url("/login")

text = @browser.text_field :id, "signup_email"
text.set "aoloyede@testingcircle.com"

pw = @browser.text_field :id, "signup_password"
pw.set "testacademy"

@browser.button(:id, "signup_forms_submit").click

@browser.a(:id, "new_post_label_quote").click 

a = @browser.text_field :id, "post_one"
a.set "I don't know you but I feel you"

@browser.button(:class, "create_post_button chrome blue txt ").click 

@browser.div(:class, "post_wrapper").wait_until_present

    puts "Correct" if @browser.text.include? "don't know you but I feel you"


binding.pry

browser.close 
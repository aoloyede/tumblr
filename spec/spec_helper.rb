require 'rspec'
require 'watir'

RSpec.configure do |config|
    config.color = true
    config.tty = true
    config.formatter = :documentation 
end 

def url(link)
    "http://tumblr.com#{link}"
end 


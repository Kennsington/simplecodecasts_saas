# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.stmp_settings = {
    :address => 'stmp.sendgrid.net',
    :port => '587',
    :authentication => :plain,


    
}
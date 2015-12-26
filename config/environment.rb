# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.stmp_settings = {
    :address => 'stmp.sendgrid.net',
    :port => '587',
    :authentication => :plain,
<<<<<<< HEAD
    :user_name => ENV['SENDGRID_USERNAME'],
=======
    :username => ENV['SENDGRID_USERNAME'],
>>>>>>> e8675bf0f1dbf1bcbff087fe1927c6a7cf84d09a
    :password => ENV['SENDGRID_PASSWORD'],
    :domain => 'heroku.com',
    :enable_startstls_auto => true
    
}
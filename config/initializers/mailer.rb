require 'tlsmail'     
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE) 
ActionMailer::Base.delivery_method = :smtp 
ActionMailer::Base.perform_deliveries = true 
ActionMailer::Base.raise_delivery_errors = true 
ActionMailer::Base.smtp_settings = { 
  :enable_starttls_auto => true,   
  :address            => 'smtp.gmail.com', 
  :port               => 587, 
  :tls                  => true, 
  :domain             => 'overnite.me',  
  :authentication     => :plain, 
  :user_name          => 'info@overnite.me', 
  :password           => ENV['MAIL_PASS']
}
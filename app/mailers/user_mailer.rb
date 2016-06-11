class UserMailer < ApplicationMailer
  default from: "info@bikeberlin.com"
  
  def contact_form(email, name, message)
    @message = message
    mail(:from => email, :to => 'mbrady1320@gmail.com', :subject => "A new contact form message from #{name}")
  end
end
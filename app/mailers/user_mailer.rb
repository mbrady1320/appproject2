class UserMailer < ApplicationMailer
  default from: "info@bikeberlin.com"
  
  def contact_form(email, name, message)
    @message = message
    mail(:from => email, :to => 'mbrady1320@gmail.com', :subject => "A new contact form message from #{name}")
  end
  
  def welcome(user)
  @appname = "Bike Shop"
  mail( :to => user.email,
        :subject => "Welcome to #{@appname}!")
  end
end


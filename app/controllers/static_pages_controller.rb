class StaticPagesController < ApplicationController
  
  def index
    @featured_product = Product.first
    @products = Product.limit(3)
  end
  
  def landing_page
    @featured_product = Product.first
    @products = Product.limit(3)
  end
  
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(:from => @email,
      :to => 'mbrady1320@gmail.com',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver_now
  end
end

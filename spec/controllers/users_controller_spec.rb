require 'rails_helper'

describe UsersController, :type => :controller do
  @user1 = User.create!(email:"user1@email.com", password:"1234567890") 
  @user2 = User.create!(email:"user2@email.com", password:"1234567890") 

  describe "GET #show" do
    
    context "User is logged in" do
      before do
        sign_in @user1
      end
      
      context "loads correct user details" do
        get :show, :id => @user1.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user1
      end
    end
  end
  
  context "another user viewing other user's details" do
    it "redirects to login page" do
      get :show, :id => @user2.id
      expect(response).to redirect_to(root_path)
    end
  end
  
  
  context "No user is logged in" do
    it "redirects to login" do
      get :show, id: user.id
      expect(response).to redirect_to(root_path)
    end
  end
  
end
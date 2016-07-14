class UserRegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
    end
  end
    
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
  
end  


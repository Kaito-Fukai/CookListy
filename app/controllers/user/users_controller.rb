class User::UsersController < ApplicationController
  before_action :authenticate_user!
  # skip_before_filter :verify_authenticity_token, :only => :destroy


  def show
    @user = User.find(current_user.id)
  end

  def profile_edit
    @user = User.find(current_user.id)
  end

  def profile_update
    @user = User.find(current_user.id)
    @user.resource.update_with_password(configure_user_params)
    bypass_sign_in(@user)
    redirect_to user_path(current_user)
  end

  def helper_edit
    @user = User.find(current_user.id)
  end

  def helper_update
    @user = User.find(current_user.id)
    @user.update(helpers_params)
    redirect_to user_path(current_user)
  end


  private

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def configure_user_params
    devise_parameter_sanitizer.permit(:account_update, keys: [ :last_name,
                                                               :first_name, 
                                                               :last_name_kana, 
                                                               :first_name_kana, 
                                                               :password, 
                                                               :password_confirmation])
    # params.require(:user).permit()
  end

  def helpers_params
    params.require(:user).permit(:helper_name_1, :helper_address_1, :helper_name_2, :helper_address_2, :helper_name_3, :helper_address_3)
  end

   def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [ :agreement, :profile, :sex, :telephone_number])
  end

end




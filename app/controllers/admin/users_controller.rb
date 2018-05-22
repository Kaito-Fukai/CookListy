class Admin::UsersController < ApplicationController
  before_action :authenticate_administrator!


  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
	redirect_to admin_user_path(params[:user_id])
  end

  def retire
  	user = User.find(params[:user_id])
	user.retire_flag = true
	user.save!
	redirect_to admin_user_path(params[:user_id])
  end

  def entitle
  	user = User.find(params[:user_id])
	user.retire_flag = '会員'
	user.save!
	redirect_to admin_user_path(params[:user_id])
  end


  private
  def user_params
  	params.require(:user).permit(:last_name,
                                 :first_name, 
                                 :last_name_kana, 
                                 :first_name_kana, 
                                 :helper_name_1,
                                 :helper_address_1,
					             :helper_name_2,
                                 :helper_address_2,
				                 :helper_name_3,
                                 :helper_address_3)
  end

end

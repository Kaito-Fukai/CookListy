class Admin::AdministratorsController < ApplicationController
  before_action :authenticate_administrator!

  def show
  	@admin = Administrator.find(params[:id])
  end

  def edit
  	@admin = Administrator.find(params[:id])
  end

  def update
  	admin = Administrator.find(params[:id])
  	admin.update(update_admin_params)
  	redirect_to admin_administrator_path(current_user)
  end

  private

  def update_admin_params
  	params.require(:administrator).permit(:name, :email)
  end
end

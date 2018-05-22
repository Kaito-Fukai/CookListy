class User::StockListsController < ApplicationController
helper_method :sort_column, :sort_direction
before_action :authenticate_user!

  def show
  	@stocks = StockList.where(user_id: current_user.id).order(sort_column + ' ' + sort_direction)
  	@new_stock = StockList.new
  end

  def create
    new_stock = StockList.new(stock_list_params)
    new_stock.user_id = current_user.id
    new_stock.save!
    redirect_to stock_list_path(current_user)
  end

  def destroy
    if params[:id] == 'destroy_all'
       stocks = StockList.where(user_id: current_user.id)
       stocks.destroy_all
     else
       stock = StockList.find(params[:id])
       stock.destroy
    end
    redirect_to stock_list_path(current_user)
  end

private
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def sort_column
      StockList.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def stock_list_params
    params.require(:stock_list).permit(:ingredient_id, :quantity, :limit, :stock_image)
  end

end

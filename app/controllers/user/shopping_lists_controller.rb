class User::ShoppingListsController < ApplicationController
helper_method :sort_column, :sort_direction
before_action :authenticate_user!

  def show
  	@ingredients = ShoppingList.where(user_id: current_user.id).order(sort_column + ' ' + sort_direction)
    @new_ingredient = ShoppingList.new
  end


  def create
    if params[:i] == "new_ingredient" # shopping_list#show内追加フォームから投稿した場合
       new_ingredient = ShoppingList.new(sl_params)
       new_ingredient.user_id = current_user.id
       new_ingredient.save
       redirect_to shopping_list_path(current_user)
    elsif params[:all] == "true"  # 各種レシピ画面から「全ての食材を追加」した場合
      @ingredients = IngredientRecipe.where(recipe_id: params[:recipe_id])
      @ingredients.each do |i|
        @list_item = ShoppingList.new(recipe_id: params[:recipe_id])
        @list_item.user_id = current_user.id
        @list_item.ingredient_id = i.ingredient.id
        @list_item.quantity = i.quantity
        @list_item.save!
      end
      session[:recipe_id] = params[:recipe_id]
      redirect_to recently_cooked_recipes_create_path
    elsif params[:i].nil?
      flash[:alert] = '食材を一つ以上チェックしてください'
      redirect_to recipe_path(params[:recipe_id])
    else @ingredients = IngredientRecipe.find(params[:i]) # 各種レシピ画面からチェックボックスを使用して追加した場合（i)にingredient.idが配列で格納されている
      @ingredients.each do |i|
        @list_item = ShoppingList.new(recipe_id: params[:recipe_id])
        @list_item.user_id = current_user.id
        @list_item.ingredient_id = i.ingredient.id
        @list_item.quantity = i.quantity
        @list_item.save!
      end
      session[:recipe_id] = params[:recipe_id]
      redirect_to recently_cooked_recipes_create_path
    end
  end

  def new
  end

  def edit
    @ingredient = ShoppingList.find(params[:id])
    @ingredients = ShoppingList.where(user_id: current_user.id).order(sort_column + ' ' + sort_direction)
    @new_ingredient = ShoppingList.new
  end

  def update
    @ingredient = ShoppingList.find(params[:id])
    @ingredient.update!(sl_params)
    redirect_to shopping_list_path(current_user)
  end

  def destroy
    if params[:id] == 'destroy_all'
       @ingredient = ShoppingList.where(user_id: current_user.id)
       @ingredient.destroy_all
     else
       @ingredient = ShoppingList.find(params[:id])
       @ingredient.destroy
    end
    redirect_to shopping_list_path(current_user)
  end

  def send_mail
    SampleMailer.send_when_update(current_user).deliver
    @ingredients = ShoppingList.where(user_id: current_user.id)
    redirect_to shopping_list_path(current_user)
  end

  private
  def sl_params
    params.require(:shopping_list).permit(:user_id, :ingredient_id, :quantity)
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def sort_column
      ShoppingList.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

end

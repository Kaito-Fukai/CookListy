class Admin::TagsController < ApplicationController
  before_action :authenticate_administrator!

  def index
  	@q = Tag.ransack(params[:q])

  	@tags = Tag.all
  	@new = Tag.new
  end

  def create
  	@new = Tag.new(tag_params)
  	@new.save
  	redirect_to admin_tags_path
  end

  def search
  	@new = Tag.new
  	@q = Tag.search(search_params)
  	@tags = @q.result(distinct: true)
    @word = params[:q]["word_cont"]
  end

  def edit
  	@tag = Tag.find(params[:id])
    @q = Tag.ransack(params[:q])
    @tags = Tag.all
  end

  def update
  	@tag = Tag.find(params[:id])
  	@tag.update(tag_params)
  	redirect_to admin_tags_path
  end

  def destroy
  	@tag = Tag.find(params[:id])
  	@tag.destroy
  	redirect_to admin_tags_path
  end

  private
  	def tag_params
  		params.require(:tag).permit(:word, :category)
  	end

  	def search_params
		params.require(:q).permit!
	end
end

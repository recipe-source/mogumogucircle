class RecipesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

  def new
        @recipe = Recipe.new
  end

  def show
        @recipe = Recipe.find_by(id: params[:id])
    end

  def index
    if params[:search] == nil
        @recipes= Recipe.all
      elsif params[:search] == ''
        @recipes= Recipe.all
      else
        #部分検索
        @recipes = Recipe.where("body LIKE ? ",'%' + params[:search] + '%')
      end
  end

  def create
    recipe = Recipe.new(recipe_params)

    recipe.user_id = current_user.id  

    if recipe.save
      flash[:notice] = "診断が完了しました"
            redirect_to recipe_path(recipe.id)
    else
       redirect_to :action => "new"
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :material, :process, :cost, :time, :image)
  end

  
end

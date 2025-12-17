class RecipesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

  def new
        @recipe = Recipe.new
  end

  def show
        @recipe = Recipe.find_by(id: params[:id])
        if @recipe.nil?
        redirect_to recipes_path, alert: "指定されたレシピは見つかりませんでした。"
        return
        end
  end

  def index
   if params[:search].present?
    @recipes = Recipe.where(
      "name LIKE ? OR material LIKE ? OR process LIKE ?",
      "%#{params[:search]}%",
      "%#{params[:search]}%",
      "%#{params[:search]}%"
    )
   else
    @recipes = Recipe.all
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
  

   def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: "レシピを削除しました。"
   end
   private
   def recipe_params
     params.require(:recipe).permit(:name, :material, :process, :cost, :time, :image)
   end
end

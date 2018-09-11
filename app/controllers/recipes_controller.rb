class RecipesController < ApplicationController
    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty, :ingredients, :cook_time, :cook_method))
        @recipe.save
        redirect_to recipe_path(@recipe.id)
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty, :ingredients, :cook_time, :cook_method))
        redirect_to recipe_path(@recipe.id)
    end
end

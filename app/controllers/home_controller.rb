class HomeController < ApplicationController
    def index
        @recipes_featured = Recipe.where(featured: true)
        @recipes = Recipe.where(featured: false)
        
        @recipes = Recipe.all
        @recipetypes = RecipeType.all
        @cuisines = Cuisine.all
    end
end

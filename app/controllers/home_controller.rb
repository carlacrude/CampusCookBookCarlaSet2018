class HomeController < ApplicationController
    def index
        @recipes_featured = Recipe.where(featured: true)
        @recipes = Recipe.where(featured: false)
    end
end

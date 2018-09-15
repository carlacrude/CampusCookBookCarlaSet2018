class RecipesController < ApplicationController
    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty, :ingredients, :cook_time, :cook_method, :recipe_image, :featured))
        if @recipe.save
            redirect_to recipe_path(@recipe.id)
            flash[:success]='Sua receita foi cadastrada com sucesso'
        else
            flash[:notice]='Você deve informar todos os dados da receita'
            render 'new'
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty, :ingredients, :cook_time, :cook_method, :recipe_image, :featured))
            flash[:success]='Sua receita foi editada com sucesso'
            if !@recipe.featured_before_last_save && @recipe.featured?
                flash[:success] = 'Receita marcada como destaque com sucesso!'   
            end
            redirect_to recipe_path(@recipe.id)
        else
            render 'edit'
        end
    end
end

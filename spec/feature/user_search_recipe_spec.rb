require 'rails_helper'

feature 'user search recipe' do
  scenario 'successfully' do
        
    recipe_type = RecipeType.create(name: 'Prato Principal')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes', 
                  recipe_image: File.new(Rails.root.join('spec', 'support', 'fixtures', 'Feijoada.jpg')))
    
    visit root_path
    
    fill_in 'Buscar', with: 'Bolo de cenoura'
    click_on 'Buscar'

    expect(page).to have_css('h5', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
  end
end

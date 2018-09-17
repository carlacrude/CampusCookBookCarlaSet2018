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

  scenario 'by recipetype' do
    recipe_type_prato_principal = RecipeType.create(name: 'Prato Principal')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_prato_principal = Recipe.create(title: 'Feijoada', difficulty: 'Médio',
                                          recipe_type: recipe_type_prato_principal, cuisine: cuisine,
                                          cook_time: 50, ingredients: 'Feijão',
                                          cook_method: 'Cozinhe o feijão e colocar coisas gordas junto, rs', 
                                          recipe_image: File.new(Rails.root.join('spec', 'support', 'fixtures', 'Feijoada.jpg')))

    recipe_type_sobremesa = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_sobremesa = Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                                    recipe_type: recipe_type_sobremesa, cuisine: cuisine,
                                    cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes', 
                                    recipe_image: File.new(Rails.root.join('spec', 'support', 'fixtures', 'bolo.jpg')))

    visit root_path
    
    expect(page).to have_css('h4', text: 'Tipo')
    expect(page).to have_css('li', text: recipe_type_prato_principal.name)
    expect(page).to have_css('li', text: recipe_type_sobremesa.name)
  end
end

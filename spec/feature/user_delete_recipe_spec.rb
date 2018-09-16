require 'rails_helper'

feature 'User delete recipe' do
  scenario 'successfully' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes', 
                  recipe_image: File.new(Rails.root.join('spec', 'support', 'fixtures', 'Feijoada.jpg')))

    visit root_path
    click_on 'Bolo de cenoura'
    click_on 'Excluir'

    expect(page).to have_content('Deseja excluir esta receita?')
  end

  scenario 'and show a confirmation message' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes', 
                  recipe_image: File.new(Rails.root.join('spec', 'support', 'fixtures', 'Feijoada.jpg')))

    visit root_path
    click_on 'Bolo de cenoura'
    click_on 'Excluir'
    click_on 'Sim'

    expect(page).to have_content('Sua receita foi excluída com sucesso')
    expect(page).not_to have_content('Bolo de cenoura')
    expect(current_path).to eq(root_path)
  end
end


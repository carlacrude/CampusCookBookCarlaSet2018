require 'rails_helper'

feature 'Visitor view recipe details' do
  scenario 'successfully' do
    #cria os dados necessários
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes', 
                           recipe_image: File.new(Rails.root.join('spec', 'support', 'fixtures', 'Feijoada.jpg')))

    # simula a ação do usuário
    visit root_path
    click_on recipe.title

    # expectativas do usuário após a ação
    expect(page).to have_css('h2', text: recipe.title)
    expect(page).to have_css('h5', text: 'Detalhes')
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")
    expect(page).to have_css('h5', text: 'Ingredientes')
    expect(page).to have_css('li', text: recipe.ingredients)
    expect(page).to have_css('h5', text: 'Como Preparar')
    expect(page).to have_css('li', text: recipe.cook_method)
  end

  scenario 'and view return button' do
    #cria os dados necessários
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes', 
                           recipe_image: File.new(Rails.root.join('spec', 'support', 'fixtures', 'Feijoada.jpg')))

    # simula a ação do usuário
    visit root_path
    click_on recipe.title

    # expectativa da rota atual
    expect(page).to have_css('a.btn.btn-secondary', text: 'Voltar')
  end

  scenario 'and return to recipe list' do
    #cria os dados necessários
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes', 
                           recipe_image: File.new(Rails.root.join('spec', 'support', 'fixtures', 'Feijoada.jpg')))

    # simula a ação do usuário
    visit root_path
    click_on recipe.title
    click_on 'Voltar'

    # expectativa da rota atual
    expect(current_path).to eq(root_path)
  end
end

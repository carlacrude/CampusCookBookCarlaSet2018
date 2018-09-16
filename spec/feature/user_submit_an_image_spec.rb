require 'rails_helper'

feature 'User attach photo to recipe' do

  scenario 'sucessfully' do
    RecipeType.create(name: 'Entrada')
    Cuisine.create(name: 'Arabe')

    visit root_path
    click_on 'Cadastrar receita'


    fill_in 'Título', with: 'Tabule'
    select 'Arabe', from: 'Cozinha'
    select 'Entrada', from: 'Tipo da Receita'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '45'
    fill_in 'Ingredientes', with: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha'
    fill_in 'Como Preparar', with: 'Misturar tudo e servir. Adicione limão a gosto.'
    attach_file('Foto da Receita', Rails.root.join('spec', 'support', 'fixtures', 'Feijoada.jpg'))

    click_on 'Enviar'

    expect(page).to have_xpath("//img[contains(@src,'Feijoada.jpg')]")
  end

  scenario 'and doesnt uploud image' do
    RecipeType.create(name: 'Entrada')
    Cuisine.create(name: 'Arabe')

    visit root_path
    click_on 'Cadastrar receita'

    fill_in 'Título', with: 'Tabule'
    select 'Arabe', from: 'Cozinha'
    select 'Entrada', from: 'Tipo da Receita'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '45'
    fill_in 'Ingredientes', with: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha'
    fill_in 'Como Preparar', with: 'Misturar tudo e servir. Adicione limão a gosto.'

    click_on 'Enviar'

    expect(page).to have_content('Você deve informar todos os dados da receita')
  end


  scenario 'and is not an image' do

    RecipeType.create(name: 'Entrada')
    Cuisine.create(name: 'Arabe')

    visit root_path
    click_on 'Cadastrar receita'

    fill_in 'Título', with: 'Tabule'
    select 'Arabe', from: 'Cozinha'
    select 'Entrada', from: 'Tipo da Receita'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '45'
    fill_in 'Ingredientes', with: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha'
    fill_in 'Como Preparar', with: 'Misturar tudo e servir. Adicione limão a gosto.'
    attach_file('Foto da Receita', Rails.root.join('spec', 'support', 'fixtures', 'file.txt'))

    click_on 'Enviar'

    expect(page).to have_content('Tipo da imagem não é válido')
  end


end

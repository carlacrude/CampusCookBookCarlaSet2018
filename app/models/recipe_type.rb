class RecipeType < ApplicationRecord
    validates :name, presence: true
    
    has_many :recipes
    has_many :cuisines
end

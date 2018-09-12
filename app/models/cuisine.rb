class Cuisine < ApplicationRecord
    validates :name, presence: true
    
    has_many :recipes
    has_many :recipe_types
end

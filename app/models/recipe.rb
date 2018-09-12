class Recipe < ApplicationRecord
    validates :title, :cook_time, :cook_method, :ingredients, :recipe_type, :cuisine, :difficulty, presence: true
    belongs_to :recipe_type
end

class ChangeFeaturedDefaultToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_default :recipes, :featured, from: true, to: false
  end
end

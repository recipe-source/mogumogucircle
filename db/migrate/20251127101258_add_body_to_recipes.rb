class AddBodyToRecipes < ActiveRecord::Migration[7.2]
  def change
    add_column :recipes, :body, :text
  end
end

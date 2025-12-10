class AddQuestionsToRecipes < ActiveRecord::Migration[7.2]
  def change
    add_column :recipes, :question1, :string
    add_column :recipes, :question2, :string
  end
end

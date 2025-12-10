class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :material
      t.text :process
      t.integer :cost
      t.integer :time

      t.timestamps
    end
  end
end

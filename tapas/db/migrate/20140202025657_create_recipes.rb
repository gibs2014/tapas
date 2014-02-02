class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :category
      t.string :quantity
      t.string :calories
      t.string :preparation
      t.text :prep_time
    end
  end
end

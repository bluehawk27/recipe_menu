class AddPhoneToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :phone, :string
  end
end

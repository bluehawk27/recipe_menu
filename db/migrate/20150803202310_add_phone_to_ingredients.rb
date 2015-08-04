class AddPhoneToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :phone, :string
  end
end

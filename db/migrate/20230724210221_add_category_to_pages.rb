class AddCategoryToPages < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :category, :string
  end
end

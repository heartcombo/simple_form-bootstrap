class AddCategoryToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :category, :string
  end
end

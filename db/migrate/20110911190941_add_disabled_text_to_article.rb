class AddDisabledTextToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :disabled_text, :string
  end
end

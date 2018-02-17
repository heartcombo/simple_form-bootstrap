class AddDisabledTextToArticle < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :disabled_text, :string
  end
end

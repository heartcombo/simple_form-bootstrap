class AddSecretToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :secret, :boolean
  end
end

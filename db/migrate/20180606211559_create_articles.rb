class CreateArticles < ActiveRecord::Migration[4.2][5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :user_name
      t.string :password
      t.timestamps
    end
  end
end

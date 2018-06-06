class CreateFavarites < ActiveRecord::Migration[5.1]
  def change
    create_table :favarites do |t|
      t.integer :article_id
      t.integer :session_id
      t.timestamps
    end
  end
end

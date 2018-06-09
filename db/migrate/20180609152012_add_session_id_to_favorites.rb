class AddSessionIdToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :session_id, :integer
  end
end

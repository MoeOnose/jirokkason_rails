class ChangeStringSessionIdOfFavorites < ActiveRecord::Migration[5.1]
  def change
    change_column :favorites, :session_id, :string
  end
end

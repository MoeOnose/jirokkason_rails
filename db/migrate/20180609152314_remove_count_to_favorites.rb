class RemoveCountToFavorites < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :count, :integer
  end
end

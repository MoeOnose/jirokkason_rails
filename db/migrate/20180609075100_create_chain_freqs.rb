class CreateChainFreqs < ActiveRecord::Migration[5.1]
  def change
    create_table :chain_freqs do |t|
      t.text :prefix1
      t.text :prefix2
      t.text :suffix
      t.integer :freq

      t.timestamps
    end
  end
end

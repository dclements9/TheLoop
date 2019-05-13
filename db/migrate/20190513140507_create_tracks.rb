class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.decimal :length
      t.integer :type
      t.string :address
      t.integer :reviews_id
    end
  end
end

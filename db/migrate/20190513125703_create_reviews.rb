class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |r|
      r.string :track_name
      r.integer :overall
      r.integer :vendors
      r.integer :child_friendly
      r.integer :walkability
      r.integer :crowds
      r.string :comments
      r.integer :user_id
    end
  end
end

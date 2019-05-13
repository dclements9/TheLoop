class AddTracksIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :track_id, :integer
  end
end

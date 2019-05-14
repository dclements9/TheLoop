class ChangeTracksTrackTypeTypeToString < ActiveRecord::Migration
  def change
    change_column :tracks, :track_type, :string
  end
end

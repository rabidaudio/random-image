class CreateAlbumArts < ActiveRecord::Migration
  def change
    create_table :album_arts do |t|
      t.string :artist
      t.string :album
      t.string :size
      t.string :url
      t.binary :data

      t.timestamps
    end
  end
end

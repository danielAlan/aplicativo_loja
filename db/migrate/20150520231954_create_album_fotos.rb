#encoding: utf-8
class CreateAlbumFotos < ActiveRecord::Migration
  def change
    create_table :album_fotos do |t|
    	t.references :album, null: false
    	t.attachment :foto, null: false
    	t.string :comentario, limit: 200
      	t.timestamps
    end

    add_index :album_fotos, :album_id 
  end
end

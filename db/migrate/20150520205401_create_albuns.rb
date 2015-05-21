#encoding: utf-8
class CreateAlbuns < ActiveRecord::Migration
  def change
    create_table :albuns do |t|
    	t.references :categoria, null: false
    	t.string :nome, limit: 100
    	t.text :descricao
    	t.attachment :capa
    	t.timestamps
    end

    add_index :albuns, :categoria_id
  end
end

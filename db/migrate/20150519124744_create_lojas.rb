#encoding: utf-8
class CreateLojas < ActiveRecord::Migration
  def change
    create_table :lojas do |t|
      t.string :nome, limit: 100, null: false
      t.string :endereco, limit: 100, null: false
      t.attachment :foto

      t.timestamps
    end
  end
end

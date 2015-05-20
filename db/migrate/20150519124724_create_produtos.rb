#encoding: utf-8
class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome, limit: 100
      t.string :descricao, limit: 100
      t.string :recomendacao, limit: 100
      t.attachment :foto

      t.timestamps
    end
  end
end

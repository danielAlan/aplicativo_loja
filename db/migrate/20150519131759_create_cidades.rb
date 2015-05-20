#encoding: utf-8
class CreateCidades < ActiveRecord::Migration
  def change
    create_table :cidades do |t|
      t.references :estado
      t.string :uf, limit: 10
      t.string :nome, limit: 50
    end

    add_index :cidades, :estado_id
  end
end

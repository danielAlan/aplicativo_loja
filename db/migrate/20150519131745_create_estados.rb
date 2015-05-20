#encoding: utf-8
class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nome, limit: 50
      t.string :uf, limit: 5
    end
  end
end
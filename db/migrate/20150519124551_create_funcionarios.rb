#encoding: utf-8
class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome, limit: 100, null: false
      t.string :telefone, limit: 11
      t.string :telefone_contato, limit: 11
      t.string :endereco, limit: 100
      t.string :rg, limit: 14
      t.attachment :foto
      t.timestamps
    end
  end
end

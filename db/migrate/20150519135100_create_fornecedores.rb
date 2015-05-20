#encoding: utf-8
class CreateFornecedores < ActiveRecord::Migration
  def change
    create_table :fornecedores do |t|
      t.string :nome, limit: 100, null: false
      t.string :endereco, limit: 100, null: false
      t.string :telefone, limit: 11
      t.string :telefone_secundario, limit: 11
      t.string :cnpj, limit: 20
      t.timestamps
    end
  end
end
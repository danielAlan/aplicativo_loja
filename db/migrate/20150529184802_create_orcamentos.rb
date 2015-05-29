#encoding: utf-8
class CreateOrcamentos < ActiveRecord::Migration
  def change
    create_table :orcamentos do |t|
      t.string :nome, limit: 100
      t.string :endereco, limit: 100
      t.string :telefone, limit: 14
      t.string :telefone_contato, limit: 14
      t.references :cidade
      t.references :estado
      t.string :referencia, limit: 100
      t.text :descricao
      t.references :status_orcamento

      t.timestamps
    end

    add_index :orcamentos, :cidade_id
    add_index :orcamentos, :estado_id
    add_index :orcamentos, :status_orcamento_id
  end
end

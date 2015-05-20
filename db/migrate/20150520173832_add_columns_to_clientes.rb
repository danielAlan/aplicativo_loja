#encoding: utf-8
class AddColumnsToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :nome, :string, limit: 100
    add_column :clientes, :endereco, :string, limit: 100
    add_column :clientes, :telefone, :string, limit: 14
    add_column :clientes, :telefone_secundario, :string, limit: 14
    add_column :clientes, :rg, :string, limit: 14
    add_column :clientes, :cpf, :string, limit: 14
    add_reference :clientes, :estado
    add_reference :clientes, :cidade

    add_index :clientes, :estado_id
    add_index :clientes, :cidade_id
  end
end

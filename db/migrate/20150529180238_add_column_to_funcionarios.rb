#encoding: utf-8
class AddColumnToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :email, :string, limit: 100
    add_reference :funcionarios, :estado
    add_reference :funcionarios, :cidade
    add_reference :funcionarios, :loja

    add_index :funcionarios, :estado_id
    add_index :funcionarios, :cidade_id
    add_index :funcionarios, :loja_id
  end
end

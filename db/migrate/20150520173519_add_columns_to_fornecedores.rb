#encoding: utf-8
class AddColumnsToFornecedores < ActiveRecord::Migration
  def change
    add_reference :fornecedores, :estado
    add_reference :fornecedores, :cidade

    add_index :fornecedores, :estado_id
    add_index :fornecedores, :cidade_id
  end
end

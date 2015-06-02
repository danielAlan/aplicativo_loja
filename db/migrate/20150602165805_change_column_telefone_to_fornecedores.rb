#encoding: utf-8
class ChangeColumnTelefoneToFornecedores < ActiveRecord::Migration
  def up
    change_column :fornecedores, :telefone, :string, limit: 14
    change_column :fornecedores, :telefone_secundario, :string, limit: 14
  end

  def down
    change_column :fornecedores, :telefone, :string, limit: 11
    change_column :fornecedores, :telefone_secundario, :string, limit: 11
  end
end

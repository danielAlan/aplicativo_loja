#encoding: utf-8
class ChangeColumnToFuncionarios < ActiveRecord::Migration
  def up
    change_column :funcionarios, :telefone, :string, limit: 14
    change_column :funcionarios, :telefone_contato, :string, limit: 14
  end
  def down
    change_column :funcionarios, :telefone, :string, limit: 11
    change_column :funcionarios, :telefone_contato, :string, limit: 11
  end
end

#encoding: utf-8
class AddEmailToFornecedores < ActiveRecord::Migration
  def change
    add_column :fornecedores, :email, :string, limit: 50
  end
end

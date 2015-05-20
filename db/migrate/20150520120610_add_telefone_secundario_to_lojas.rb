#encoding: utf-8
class AddTelefoneSecundarioToLojas < ActiveRecord::Migration
  def change
    add_column :lojas, :telefone_secundario, :string, limit: 14
  end
end

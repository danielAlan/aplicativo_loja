#encoding: utf-8
class AddColumnToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :nome, :string, limit: 100, null: false
    add_reference :usuarios, :perfil
    add_reference :usuarios, :loja

    add_index :usuarios, :perfil_id
    add_index :usuarios, :loja_id
  end
end

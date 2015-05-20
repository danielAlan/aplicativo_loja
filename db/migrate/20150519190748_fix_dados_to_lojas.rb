#encoding: utf-8
class FixDadosToLojas < ActiveRecord::Migration
  def change
    add_column :lojas, :telefone, :string, limit: 11
    add_column :lojas, :email, :string, limit: 30
  end
end

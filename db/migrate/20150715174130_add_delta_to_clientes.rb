#encoding: utf-8
class AddDeltaToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :delta, :boolean, default: true
  end
end

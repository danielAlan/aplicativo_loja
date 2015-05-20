#encoding: utf-8
class AddColumnToFuncionario < ActiveRecord::Migration
  def change
    add_reference :funcionarios, :cargo
    add_index :funcionarios, :cargo_id
  end
end

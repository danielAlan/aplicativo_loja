#encoding: utf-8
class AddColumnsToLojas < ActiveRecord::Migration
  def change
    add_reference :lojas, :estado
    add_reference :lojas, :cidade

    add_index :lojas, :estado_id
    add_index :lojas, :cidade_id
  end
end

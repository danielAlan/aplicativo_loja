#encoding: utf-8
class CreatePerfis < ActiveRecord::Migration
  def change
    create_table :perfis do |t|
      t.string :nome, limit: 20, null: false
      t.timestamps
    end
  end
end

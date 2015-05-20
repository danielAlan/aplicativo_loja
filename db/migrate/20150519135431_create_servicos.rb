#encoding: utf-8
class CreateServicos < ActiveRecord::Migration
  def change
    create_table :servicos do |t|
      t.string :nome
      t.timestamps
    end
  end
end

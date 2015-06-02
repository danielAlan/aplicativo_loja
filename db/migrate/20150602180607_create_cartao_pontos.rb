#encoding: utf-8
class CreateCartaoPontos < ActiveRecord::Migration
  def change
    create_table :cartao_pontos do |t|
      t.references :funcionario
      t.date :data
      t.time :entrada
      t.time :almoco_saida
      t.time :almoco_entrada
      t.time :saida
      t.timestamps
    end

    add_index :cartao_pontos, :funcionario_id
  end
end

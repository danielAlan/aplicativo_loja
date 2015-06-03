#encoding: utf-8
class CreateCartaoPontosDias < ActiveRecord::Migration
  def change
    create_table :cartao_pontos_dias do |t|
      t.references :cartao_ponto
      t.date :data
      t.time :entrada
      t.time :almoco_saida
      t.time :almoco_entrada
      t.time :saida
      t.timestamps
    end

    add_index :cartao_pontos_dias, :cartao_ponto_id
  end
end

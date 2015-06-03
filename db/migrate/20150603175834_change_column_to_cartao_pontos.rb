#encoding: utf-8
class ChangeColumnToCartaoPontos < ActiveRecord::Migration
  def up
    remove_column :cartao_pontos, :entrada, :time
    remove_column :cartao_pontos, :almoco_saida, :time
    remove_column :cartao_pontos, :almoco_entrada, :time
    remove_column :cartao_pontos, :saida, :time
    remove_column :cartao_pontos, :data, :date
    add_column :cartao_pontos, :mes, :string, limit: 2
    add_column :cartao_pontos, :ano, :integer, limit: 4
  end

  def down
    add_column :cartao_pontos, :entrada, :time
    add_column :cartao_pontos, :almoco_saida, :time
    add_column :cartao_pontos, :almoco_entrada, :time
    add_column :cartao_pontos, :saida, :time
    add_column :cartao_pontos, :data, :date
    remove_column :cartao_pontos, :mes, :string
    remove_column :cartao_pontos, :ano, :string
  end
end

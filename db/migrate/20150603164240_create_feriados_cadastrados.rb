#encoding: utf-8
class CreateFeriadosCadastrados < ActiveRecord::Migration
  def change
    create_table :feriados_cadastrados do |t|
      t.references :tipo_feriado
      t.string :descricao, limit: 100
      t.string :data, limit: 8
    end

    add_index :feriados_cadastrados, :tipo_feriado_id
  end
end

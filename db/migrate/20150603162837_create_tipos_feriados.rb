#encoding: utf-8
class CreateTiposFeriados < ActiveRecord::Migration
  def change
    create_table :tipos_feriados do |t|
      t.string :nome, limit: 100, null: false
    end

    TipoFeriado.create([
      {nome: "Federal"},
      {nome: "Estadual"},
      {nome: "Municipal"}
    ])
  end
end

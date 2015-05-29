#encoding: utf-8
class CreateStatusOrcamentos < ActiveRecord::Migration
  def change
    create_table :status_orcamentos do |t|
      t.string :nome, limit: 100, null: false
      t.timestamps
    end

    StatusOrcamento.create([
      {:nome => "Aguardando"},
      {:nome => "Agendado"},
      {:nome => "Realizado"},
      {:nome => "Terminado"}
    ])
  end
end

#encoding: utf-8
class AddDataHoraToOrcamentos < ActiveRecord::Migration
  def change
    add_column :orcamentos, :data_agendamento, :date
    add_column :orcamentos, :hora_agendamento, :time
    add_column :orcamentos, :data_visita, :date
    add_column :orcamentos, :hora_visita, :time
  end
end

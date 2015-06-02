#encoding: utf-8
class AddDataAdmissaoToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :data_admissao, :date
  end
end

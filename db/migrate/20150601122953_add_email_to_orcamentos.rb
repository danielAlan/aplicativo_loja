#encoding: utf-8
class AddEmailToOrcamentos < ActiveRecord::Migration
  def change
    add_column :orcamentos, :email, :string, limit: 100
  end
end

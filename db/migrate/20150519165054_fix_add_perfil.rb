#encoding: utf-8
class FixAddPerfil < ActiveRecord::Migration
  def change
    Perfil.create!([
      {nome: "Administrador"},
      {nome: "Gerente"},
      {nome: "Vendedor"}
    ])
  end
end
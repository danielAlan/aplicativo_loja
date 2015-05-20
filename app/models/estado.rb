#encoding: utf-8
class Estado < ActiveRecord::Base

  # ---- Relacionamentos ----

  has_many :lojas, class_name: "Loja"
  has_many :fornecedores, class_name: "Fornecedor"
  has_many :clientes, class_name: "Cliente"

  # ---- Atributo Alias ----

  alias_attribute :name, :nome
end

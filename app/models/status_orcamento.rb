# encoding: utf-8
class StatusOrcamento < ActiveRecord::Base

  # ----- Relacionamentos -----

  has_many :orcamentos


  # ---- Atributo Alias ----

  alias_attribute :name, :nome
end

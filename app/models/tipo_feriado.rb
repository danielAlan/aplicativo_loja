#encoding: utf-8
class TipoFeriado < ActiveRecord::Base

  # ---- Relacionamentos ----

  has_many :feriados_cadastrados

  # ---- Alias Atributo ----

  alias_attribute :name, :nome
end

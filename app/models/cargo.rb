class Cargo < ActiveRecord::Base

  # ---- Relacionamentos ----

  has_many :funcionarios

  # ---- Atributo Álias ----

  alias_attribute :name, :nome
end

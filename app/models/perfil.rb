class Perfil < ActiveRecord::Base

  # ---- Relacionamentos ----

  has_many :usuarios, class_name: "Usuario"

  # ---- Validações ----

  validates :nome, presence:true
  validates :nome, uniqueness:true

  # ---- Alias Atributo -----

  alias_attribute :name, :nome
end

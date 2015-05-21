#encoding: utf-8
class Categoria < ActiveRecord::Base

	# ---- Relacionamentos -----

	has_many :albuns, class_name: "Album"

	# ---- Atributo Alias ----

  alias_attribute :name, :nome
end

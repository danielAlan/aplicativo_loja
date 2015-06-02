#encoding: utf-8
class Fornecedor < ActiveRecord::Base

  # ---- Relacionamentos ----

  belongs_to :cidade, class_name: "Cidade"
  belongs_to :estado, class_name: "Estado"

  # ---- Delegate ----

  delegate :nome, to: :cidade, prefix: :cidade, allow_nil: true
  delegate :nome, to: :estado, prefix: :estado, allow_nil: true
end

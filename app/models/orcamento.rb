#encoding: utf-8
class Orcamento < ActiveRecord::Base

  # ----- Relacionamentos ----

  belongs_to :cidade
  belongs_to :estado
  belongs_to :status_orcamento

  # ---- Delegate ----

  delegate :nome, to: :status_orcamento, prefix: :status_orcamento, allow_nil: true
  delegate :nome, to: :cidade, prefix: :cidade, allow_nil: true
  delegate :nome, to: :estado, prefix: :estado, allow_nil: true
end

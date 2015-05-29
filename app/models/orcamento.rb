#encoding: utf-8
class Orcamento < ActiveRecord::Base

  # ----- Relacionamentos ----

  belongs_to :cidade
  belongs_to :estado
  belongs_to :status_orcamento
end

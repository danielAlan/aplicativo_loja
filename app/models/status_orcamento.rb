# encoding: utf-8
class StatusOrcamento < ActiveRecord::Base

  # ----- Relacionamentos -----

  has_many :orcamentos
end

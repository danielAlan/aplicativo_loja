#encoding: utf-8
class CartaoPonto < ActiveRecord::Base

  # ---- Relacionamentos ----

  has_many :cartao_pontos_dias
end

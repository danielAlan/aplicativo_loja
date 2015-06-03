#encoding: utf-8
class CartaoPontoDia < ActiveRecord::Base

  # ---- Relacionamentos ----

  belongs_to :cartao_ponto
end

#encoding: utf-8
module LojasHelper
  def lojas_cadastradas
    Loja.order(:nome)
  end
end

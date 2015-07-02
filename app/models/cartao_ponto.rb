#encoding: utf-8
class CartaoPonto < ActiveRecord::Base

  # ---- Relacionamentos ----

  has_many :cartao_pontos_dias

  # ---- Métodos ----

  def gerar_cartao_funcionario(id)
    #Gerar o cartao de Ponto
    cartao_ponto_params = {:funcionario_id => id}
    cartao_ponto_params.merge!(:mes => "#{Date.current.month}")
    cartao_ponto_params.merge!(:ano => Date.current.year)
    @cartao_ponto = CartaoPonto.new(cartao_ponto_params)

    #Gerar o Cartao com todos os dias
    if @cartao_ponto.save!
      (Date.current.beginning_of_month..Date.current.end_of_month).each do |dia|
        cartao_pontos_dias_params = {}
        cartao_pontos_dias_params.merge!(:cartao_ponto_id => self.id)
        cartao_pontos_dias_params.merge!(:data => dia)
        @cartao_pontos_dias = CartaoPontoDia.new(cartao_pontos_dias_params)
        @cartao_pontos_dias.save!
      end
    end
  end
end

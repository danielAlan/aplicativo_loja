#encoding: utf-8
class Admin::CartaoPontosController < InheritedResources::Base
  layout "application"

  # ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Configurando Inherired Resources ----

  actions :all
  custom_actions :member => :gerar_cartao

  # ---- Métodos ----

  def index
    @funcionarios = Funcionario.order(:nome).paginate(:page => params[:page], :per_page => 10)
  end

  def edit
  	@funcionario = Funcionario.find(params[:id])
    @cartao_ponto = CartaoPonto.find(:funcionario_id => @funcionario.id)
  end

  def update
    @cartao_ponto = CartaoPonto.new(params)
  end

  def show
    @funcionario = Funcionario.find(params[:id])
    @cartao_ponto = CartaoPonto.where(:funcionario_id => @funcionario.id, :mes => "#{Date.current.month}", :ano => Date.current.year).first
    if @cartao_ponto.present?
      @cartao_pontos_dias = CartaoPontoDia.where(:cartao_ponto_id => @cartao_ponto.id)
    end
  end

  def gerar_cartao
    gerar_cartao_funcionario

    redirect_to admin_cartao_ponto_path(:funcionario_id => params[:id])
  end

  private

  def cartao_ponto_params
    params.require(:cartao_ponto).permit(:entrada, :almoco_saida, :almoco_entrada, :saida)
  end

  def gerar_cartao_funcionario
    cartao_ponto_params = {:funcionario_id => (params[:id])}
    cartao_ponto_params.merge!(:mes => "#{Date.current.month}")
    cartao_ponto_params.merge!(:ano => Date.current.year)
    @cartao_ponto = CartaoPonto.new(cartao_ponto_params)

    #Gerar o Cartao com todos os dias
    if @cartao_ponto.save!
      (Date.current.beginning_of_month..Date.current.end_of_month).each do |dia|
        cartao_pontos_dias_params = {}
        cartao_pontos_dias_params.merge!(:cartao_ponto_id => @cartao_ponto.id)
        cartao_pontos_dias_params.merge!(:data => dia)
        @cartao_pontos_dias = CartaoPontoDia.new(cartao_pontos_dias_params)
        @cartao_pontos_dias.save!
      end
    end
  end
end

#encoding: utf-8
class Admin::CartaoPontosController < InheritedResources::Base
  layout "application"

  # ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Métodos ----

  def index
    @funcionarios = Funcionario.order(:nome).paginate(:page => params[:page], :per_page => 10)
  end

  def edit
  	@funcionario = Funcionario.find(params[:id])
    # @cartao_ponto = CartaoPonto.find(:funcionario_id => @funcionario.id)
  end

  def update
    @cartao_ponto = CartaoPonto.new(params)
  end

  def show
    @funcionario = Funcionario.find(params[:id])
  end

  # def gerar_cartao
  #   gerar_cartao_funcionario(params[:funcionario_id])
  # end

  private

  def cartao_ponto_params
    params.require(:cartao_ponto).permit(:entrada, :almoco_saida, :almoco_entrada, :saida)
  end
end

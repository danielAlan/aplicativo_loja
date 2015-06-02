#encoding: utf-8
class Admin::CartaoPontosController < InheritedResources::Base
  layout "application"

  # ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Métodos ----

  def index
    @funcionarios = Funcionario.order(:nome).paginate(:page => params[:page], :per_page => 10)
  end
end

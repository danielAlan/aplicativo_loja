#encoding: utf-8
class Admin::FuncionariosController < InheritedResources::Base
  layout "application"

  # ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Métodos ----

  def index
    @funcionarios = Funcionario.order(:nome).paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)
    create! do |success, failure|
      success.html do
        redirect_to admin_funcionario_path(resource), :notice => "Funcionário criado com Sucesso"
      end
    end
  end

  def update
    @funcionario = Funcionario.find(params[:id])
    if @funcionario.update(funcionario_params)
      redirect_to admin_funcionario_path(resource), :notice => "Funcionário Atualizado com Sucesso"
    else
      render "edit"
    end
  end

  def destroy
    destroy! {admin_funcionarios_path}
  end

  private

  def funcionario_params
    params.require(:funcionario).permit(:nome, :telefone, :telefone_contato, :endereco,
      :rg, :foto, :email, :cargo_id, :cidade_id, :estado_id, :loja_id, :data_admissao)
  end
end
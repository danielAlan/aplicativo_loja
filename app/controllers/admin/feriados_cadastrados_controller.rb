#encoding: utf-8
class Admin::FeriadosCadastradosController < InheritedResources::Base
  layout "application"

  # ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Métodos ----

  def index
    @feriados_cadastrados = FeriadoCadastrado.order(:data).paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @feriado_cadastrado = FeriadoCadastrado.new(feriado_cadastrado_params)
    create! do |success, failure|
      success.html do
        redirect_to admin_feriados_cadastrados_path, :notice => "Feriado Criado com Sucesso"
      end
    end
  end

  def update
    @feriado_cadastrado = FeriadoCadastrado.find(params[:id])
    if @feriado_cadastrado.update(feriado_cadastrado_params)
      redirect_to admin_feriados_cadastrados_path, :notice => "Feriado Atualizado com Sucesso"
    else
      render "edit"
    end
  end

  def destroy
    destroy! {admin_feriados_cadastrados_path}
  end

  private

  def feriado_cadastrado_params
    params.require(:feriado_cadastrado).permit(:data, :tipo_feriado_id, :descricao)
  end
end

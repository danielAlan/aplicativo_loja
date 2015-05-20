#encoding: utf-8
class Admin::LojasController < InheritedResources::Base
  layout "application"

  # ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Métodos ----

  def index
    @lojas = Loja.order(:nome).paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @loja = Loja.new(loja_params)
    create! do |success, failure|
      success.html do
        redirect_to admin_lojas_path, :notice => "Loja Criada com Sucesso"
      end
    end
  end

  def update
    @loja = Loja.find(params[:id])
    if @loja.update(loja_params)
      redirect_to admin_lojas_path, :notice => "Loja Atualizada com Sucesso"
    else
      render "edit"
    end
  end

  def destroy
    destroy! {admin_lojas_path}
  end

  private

  def loja_params
    params.require(:loja).permit(:nome, :telefone, :telefone_secundario, :endereco, :foto, :email, :cidade_id, :estado_id)
  end
end
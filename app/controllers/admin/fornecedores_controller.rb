#encoding: utf-8
class Admin::FornecedoresController < InheritedResources::Base
  layout "application"

  # ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Métodos ----

  def index
    @fornecedores = Fornecedor.order(:nome).paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @fornecedor = Fornecedor.new
  end

  def create
    @fornecedor = Fornecedor.new(fornecedor_params)
    create! do |success, failure|
      success.html do
        redirect_to admin_fornecedor_path(resource), :notice => "Fornecedor criado com Sucesso"
      end
    end
  end

  def update
    @fornecedor = Fornecedor.find(params[:id])
    if @fornecedor.update(fornecedor_params)
      redirect_to admin_fornecedor_path(resource), :notice => "Fornecedor Atualizado com Sucesso"
    else
      render "edit"
    end
  end

  def destroy
    destroy! {admin_fornecedores_path}
  end

  private

  def fornecedor_params
    params.require(:fornecedor).permit(:nome, :cnpj, :telefone, :telefone_secundario, :endereco,
      :email, :cidade_id, :estado_id,)
  end
end

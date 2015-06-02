#encoding: utf-8
class OrcamentosController < InheritedResources::Base

  # ---- Configuração do InheritedResources ----

  actions :only => [ :new, :create, :edit, :update, :destroy, :show]

  # ---- Métodos ----

  def index
    @orcamentos = Orcamento.order("created_at DESC").
      paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @orcamento = Orcamento.new()
  end

  def create
    @orcamento = Orcamento.new(orcamento_params)
    @orcamento.status_orcamento = StatusOrcamento.find_by_name("Aguardando")
    create! do |success, failure|
      success.html do
        redirect_to orcamento_path(resource), :notice => "Orçamento Criado com Sucesso"
      end
    end
  end

  def update
    @orcamento = Orcamento.find(params[:id])
    if @orcamento.update(orcamento_params)
      redirect_to orcamento_path(resource), :notice => "Orçamento Atualizado com Sucesso"
    else
      render "edit"
    end
  end

  def destroy
    destroy! {root_path}
  end

  private

  def orcamento_params
    params.require(:orcamento).permit(:nome, :endereco, :telefone, :telefone_contato,
      :email, :cidade_id, :estado_id, :referencia, :descricao, :status_orcamento_id, :data, :hora)
  end
end

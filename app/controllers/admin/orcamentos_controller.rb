#encoding: utf-8
class Admin::OrcamentosController < InheritedResources::Base

  # ---- Configuração do InheritedResources ----

  actions :all
  custom_actions :resource => [:imprimir_orcamento, :acompanhar_orcamento]

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
        redirect_to admin_orcamento_path(resource), :notice => "Orçamento Criado com Sucesso"
      end
    end
  end

  def update
    @orcamento = Orcamento.find(params[:id])
    if @orcamento.update(orcamento_params)
      redirect_to admin_orcamento_path(resource), :notice => "Orçamento Atualizado com Sucesso"
    else
      render "edit"
    end
  end

  def acompanhar_orcamento
    @orcamento = Orcamento.find(params[:id])
  end

  def imprimir_orcamento
    respond_to do |format|
      format.pdf do
        output = RelatorioOrcamento.new(RelatorioBase::RETRATO).to_pdf(resource, current_usuario, gerar_filtros(resource))
        filename = "relatorio_orcamento.pdf"
        send_data output, :filename => filename, :type => "application/pdf"
      end
    end
  end

  def destroy
    destroy! {admin_orcamentos_path}
  end

  private

  def orcamento_params
    params.require(:orcamento).permit(:nome, :endereco, :telefone, :telefone_contato,
      :email, :cidade_id, :estado_id, :referencia, :descricao, :status_orcamento_id, :data_agendamento,
      :hora_agendamento, :data_visita, :hora_visita)
  end

  def gerar_filtros(resource)
    if resource.nome.present?
      filtro_hash = {"Cliente" => resource.nome.upcase}
      filtro_hash.merge!("Telefone" => resource.telefone)
    end
    if resource.telefone_contato.present?
      filtro_hash.merge!("Celular" => resource.telefone_contato)
    end
    if resource.endereco.present?
      filtro_hash.merge!("Endereço" => resource.endereco)
    end
    if resource.cidade.present?
      filtro_hash.merge!("Cidade" => resource.cidade_nome)
    end
    if resource.referencia.present?
      filtro_hash.merge!("Ponto de Referência" => resource.referencia)
    end
  end
end

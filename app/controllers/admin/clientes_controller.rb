#encoding: utf-8
class Admin::ClientesController < InheritedResources::Base
  layout "application"

  # ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Configuração do Inherited Resources ----

  actions :all
  custom_actions :collection => [:search, :combo_cidades]

  # ---- Métodos ----

  def index
    @clientes = Cliente.order(:nome).paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @cliente = Cliente.new(cliente_params)
    create! do |success, failure|
      success.html do
        redirect_to admin_clientes_path, :notice => "Cliente criado com Sucesso"
      end
    end
  end

  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update(cliente_params)
      redirect_to admin_clientes_path, :notice => "Cliente Atualizado com Sucesso"
    else
      render "edit"
    end
  end

  def destroy
    destroy! {admin_clientes_path}
  end

  # def search
  #   respond_to do |format|
  #     format.html do
  #       if params[:q].blank?
  #         redirect_to collection_path
  #       else
  #         @clientes = Cliente.search "@(nome,cpf_numero,identidade_numero,cpf_somente_numero,identidade_somente_numero) #{params[:q].gsub(/[\/-]/,'')}",
  #           :match_mode => :extended, :page => params[:page], :per_page => 10,

  #         render "index"
  #       end
  #     end

  #     format.json do
  #       clientes = Cliente.search "@(nome,cpf_numero,identidade_numero,cpf_somente_numero,identidade_somente_numero) #{params[:q].gsub(/[\/-]/,'')}",
  #         :match_mode => :extended, :per_page => 10, :order => "nome asc",

  #       render :json => clientes
  #     end
  #   end
  # end

  def combo_cidades
    @cidades = Cidade.select("cidades.id, cidades.nome").
      where(:estado_id => params[:id]).order(:nome)

    render :layout => false
  end

  private

  def cliente_params
    params.require(:cliente).permit(:nome, :rg, :cpf, :endereco, :telefone, :telefone_secundario,
      :estado_id, :cidade_id)
  end
end

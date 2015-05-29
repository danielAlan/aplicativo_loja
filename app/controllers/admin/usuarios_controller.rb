#encoding: utf-8
class Admin::UsuariosController < InheritedResources::Base
  layout "application"

  # ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Métodos ----

  def index
    @usuarios = Usuario.order(:nome).paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @usuarios = Usuario.new(usuario_params)
    create! do |success, failure|
      success.html do
        redirect_to admin_users_path, :notice => "Usuário Criado com Sucesso"
      end
    end
  end

  def update
    @usuarios = Usuario.find(params[:id])
    if @usuarios.update(usuario_params)
      redirect_to admin_usuarios_path, :notice => "Usuário Atualizado com Sucesso"
    else
      render "edit"
    end
  end

  def destroy
    destroy! {admin_users_path}
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :password, :loja_id, :password_confirmation, :perfil_id)
  end
end
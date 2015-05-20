#encoding: utf-8
class Admin::CategoriasController < ApplicationController
  layout "application"

  # ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Métodos ----

  def index
    @categorias = Categoria.order(:nome).paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @categoria = Categoria.new(categoria_params)
    create! do |success, failure|
      success.html do
        redirect_to admin_categorias_path, :notice => "Categoria Criada com Sucesso"
      end
    end
  end

  def update
    @categoria = Categoria.find(params[:id])
    if @categoria.update(loja_params)
      redirect_to admin_categorias_path, :notice => "Categoria Atualizada com Sucesso"
    else
      render "edit"
    end
  end

  def destroy
    destroy! {admin_categorias_path}
  end

  private

  def categoria_params
    params.require(:categoria).permit(:nome)
  end
end

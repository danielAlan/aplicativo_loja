#encoding: utf-8
class Admin::AlbunsController < InheritedResources::Base
	layout "application"

  # ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Métodos ----

  def index
    @albuns = Album.order(:nome).paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @album = Album.new(album_params)
    create! do |success, failure|
      success.html do
        redirect_to admin_albuns_path, :notice => "Album Criada com Sucesso"
      end
    end
  end

  def show
    @album = Album.find(params[:id])
    @fotos = AlbumFoto.where(:album_id => @album.id).order(:created_at)
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to admin_albuns_path, :notice => "Album Atualizado com Sucesso"
    else
      render "edit"
    end
  end

  def destroy
    destroy! {admin_albuns_path}
  end

  private

  def album_params
    params.require(:album).permit(:nome, :categoria_id, :capa, :descricao)
  end
end

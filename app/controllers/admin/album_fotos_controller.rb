#encoding: utf-8
class Admin::AlbumFotosController < InheritedResources::Base
	layout "application"

	# ---- Autorização do Ability ----

  # load_and_authorize_resource

  # ---- Inherited Resources ----

  belongs_to :album, class_name: 'Album'
  actions :all, except: :show

  # ---- Métodos ----


  def index
    debugger
    @album = Album.find(params[:album_id])
    @album_fotos = AlbumFoto.decrescente.where(:album_id => @album.id)
    @album_foto = AlbumFoto.new
  end

  def new
    render :index
  end

  def create
    @album_foto = AlbumFoto.new(album_foto_params)
    @album_foto.album_id = params[:album_id]
    create! do |success, failure|
      success.html do
        render :index
      end
    end
  end

  def edit
    @album = Album.find(params[:album_id])
    @album_foto = AlbumFoto.find(params[:id])
    @album_fotos = AlbumFoto.decrescente.where(:album_id => @album.id)
  end

  def destroy
    @album_foto = AlbumFoto.find(params[:id])
    destroy! do |success, failure|
      success.html do
        render :index
      end
    end
  end

  private

  def album_foto_params
    params.require(:album_foto).permit(:comentario, :foto)
  end
end

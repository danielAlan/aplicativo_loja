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
    @album = Album.find(params[:album_id])

    @album_fotos = AlbumFoto.where(:album_id => @album.id).
    order(:created_at)

    @album_foto = AlbumFoto.new
  end

  def create
    @album_foto = AlbumFoto.new(album_foto_params)
    @album_foto.album_id = params[:album_id]
    create! do |success, failure|
      success.html do
        render nothing: true
      end
    end
  end

  def show
    @album = Album.find(params[:album_id])
    @album_foto = AlbumFoto.find(:album_id => @album.id)
  end

  private

  def album_foto_params
    params.require(:album_foto).permit(:comentario, :foto)
  end
end

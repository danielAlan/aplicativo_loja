class Album < ActiveRecord::Base

	# ---- Relacionamentos ----

	belongs_to :categoria, class_name: "Categoria"
  has_many :albuns_fotos, class_name: "AlbumFoto"

	# ---- Arquivo attachment ----

	has_attached_file :capa, :styles => { :medium => "300x300>", :thumb => "150x100>" }, :url => '/system/:class/:attachment/:id/:style/:filename'

  # ---- Validates ----

  validates_attachment_content_type :capa, :content_type => ["image/jpeg", "image/png", "image/pjpeg", "image/x-png", "image/gif", "image/bmp", "application/octet-stream"],
    :message => "deve ser do formato jpg, png, gif ou bmp."
  validates_attachment_size :capa, less_than: 1.megabyte, message: "deve ser menor do que 1 MB"

  # ---- Delegações ----

  delegate :nome, to: :categoria, prefix: :categoria, allow_blank: true
end

#encoding: utf-8
class AlbumFoto < ActiveRecord::Base

	# ---- Relacionamentos ----

	belongs_to :album, class_name: "Album"

	# ---- Arquivo attachment ----

	has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "150x100>" }, :url => '/system/:class/:attachment/:id/:style/:filename'

  # ---- Validates ----

  validates_attachment_content_type :foto, :content_type => ["image/jpeg", "image/png", "image/pjpeg", "image/x-png", "image/gif", "image/bmp", "application/octet-stream"],
    :message => "deve ser do formato jpg, png, gif ou bmp."
  validates_attachment_size :foto, less_than: 1.megabyte, message: "deve ser menor do que 1 MB"

  # ---- Delegações ----
end
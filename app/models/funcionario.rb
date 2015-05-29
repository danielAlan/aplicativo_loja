class Funcionario < ActiveRecord::Base

  # ---- Relacionamentos ----

  belongs_to :cargo
  belongs_to :cidade
  belongs_to :estado
  belongs_to :loja

  # ---- Attached ------

  has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "150x100>" }, :url => '/system/:class/:attachment/:id/:style/:filename'

  validates_attachment_content_type :foto, :content_type => ["image/jpeg", "image/png", "image/pjpeg", "image/x-png", "image/gif", "image/bmp", "application/octet-stream"],
    :message => "deve ser do formato jpg, png, gif ou bmp."
  validates_attachment_size :foto, less_than: 1.megabyte, message: "deve ser menor do que 1 MB"


  # ---- Delegates -----

  delegate :nome, to: :cargo, prefix: :cargo, allow_nil: true
  delegate :nome, to: :loja, prefix: :true, allow_nil: true
end

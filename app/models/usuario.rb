#encoding: utf-8
class Usuario < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # ---- Relacionamentos ----

  belongs_to :loja, class_name: "Loja"
  belongs_to :perfil, class_name: "Perfil"


  # ---- Delegates -----

  delegate :nome, to: :loja, prefix: :loja, allow_nil: true
  delegate :nome, to: :perfil, prefix: :perfil, allow_nil: true

  # ---- Métodos ----

  def administrador
    self.perfil_nome.downcase == "administrador" ? true : false
  end

  def gerente
    self.perfil_nome.downcase == "gerente" ? true : false
  end

  def vendedor
    self.perfil_nome.downcase == "vendedor" ? true : false
  end

  def funcionario
    self.perfil_nome.downcase == "vendedor" ? true : false
  end
end
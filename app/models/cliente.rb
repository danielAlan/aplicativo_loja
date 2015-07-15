#encoding: utf-8
class Cliente < ActiveRecord::Base

  # ---- Relacionamentos ----

  belongs_to :cidade, class_name: "Cidade"
  belongs_to :estado, class_name: "Estado"


  def formatar_data_nascimento
    self.data_nascimento.strftime("%d/%m/%Y") if self.data_nascimento
  end

  # # ---- Indices do Sphinx ----

  # define_index do
  #   indexes nome, :sortable => true
  #   # indexes "CAST(municipes.data_nascimento AS varchar(50))", :as => :data_nascimento, :sortable => true, :type => :string
  #   indexes telefone
  #   indexes "REGEXP_REPLACE(municipes.identidade_numero, '[.-]', '', 'g')", :as => :identidade_somente_numero
  #   indexes identidade_numero
  #   indexes "REGEXP_REPLACE(municipes.cpf_numero, '[.-]', '', 'g')", :as => :cpf_somente_numero
  #   indexes cpf_numero

  #   set_property :delta => true
  # end
end

#encoding: utf-8
class FeriadoCadastrado < ActiveRecord::Base

  # ---- Relacionamentos ----

  belongs_to :tipo_feriado

  # ---- Delegates ----

  delegate :nome, to: :tipo_feriado, prefix: :tipo_feriado, allow_nil: true
end

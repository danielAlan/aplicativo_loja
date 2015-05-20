#encoding: utf-8
class Cliente < ActiveRecord::Base

  # ---- Relacionamentos ----

  belongs_to :cidade, class_name: "Cidade"
  belongs_to :estado, class_name: "Estado"
end

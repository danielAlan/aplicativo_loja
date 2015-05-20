class Cargo < ActiveRecord::Base

  # ---- Relacionamentos ----

  has_many :funcionarios
end

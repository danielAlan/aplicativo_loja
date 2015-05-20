module ApplicationHelper
  def perfis_drop_down
    Perfil.order(:nome)
  end
end

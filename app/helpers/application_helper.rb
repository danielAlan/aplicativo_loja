#encoding: utf-8
module ApplicationHelper
  def perfis_drop_down
    Perfil.order(:nome)
  end

  def verificar_valor(valor, formato=:default)
    if [Date, Time, ActiveSupport::TimeWithZone].include?(valor.class)
      valor.blank? ? "—" : l(valor, format: formato)
    else
      valor.blank? ? "—" : valor
    end
  end
end
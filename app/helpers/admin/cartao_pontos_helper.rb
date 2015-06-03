#encoding: utf-8
module Admin::CartaoPontosHelper

  def dia_semana_trabalhado?(data)
    data.cwday != 7
  end

  def quantidade_dias_trabalhados_mes
    dias_uteis = dias_uteis_mes
    total = dias_uteis.count - feriados_do_mes(dias_uteis)
  end


  def dias_trabalhados
    (Date.current.beginning_of_month..Date.current.end_of_month).each{|x| puts x}
  end

  def feriados_do_mes(dias_uteis)
    todos_feriados = FeriadoCadastrado.all.map(&:data)
    todos_feriados_datas = todos_feriados.map{|x| Date.strptime(x, '%d/%m') }
    count = 0
    dias_uteis.each do |data|
      count +=1 if todos_feriados_datas.include?(data)
    end
    count
  end

  def dias_uteis_mes
    (Date.current.beginning_of_month..Date.current.end_of_month).select{|x| x.cwday != 7}
  end
end

# -*- encoding : utf-8 -*-
class GerarCartao
  include Resque::Plugins::Status

  def perform
    funcionarios = Funcionario.all


  end
end
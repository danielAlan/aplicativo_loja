#encoding: utf-8
module Admin::OrcamentosHelper
  def status_orcamentos_cadastrados
    StatusOrcamento.all
  end
end

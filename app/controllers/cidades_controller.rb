#encoding: utf-8
class CidadesController < ApplicationController

  def buscar_cidades
    if params.present?
      estado_id = params[:id].to_i
      cidades = Cidade.where(:estado_id => estado_id).order(:nome)
      cty = []
      cidades.each do |cidade|
        cty << {:id => cidade.id, :nome => cidade.name}
      end
      render :json => {:cty => cty.compact}.as_json
    end
  end
end

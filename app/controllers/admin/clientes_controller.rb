#encoding: utf-8
class Admin::ClientesController < ApplicationController

  def search
    respond_to do |format|
      format.html do
        if params[:q].blank?
          redirect_to collection_path
        else
          @clientes = Cliente.search "@(nome,cpf_numero,identidade_numero,cpf_somente_numero,identidade_somente_numero) #{params[:q].gsub(/[\/-]/,'')}",
            :match_mode => :extended, :page => params[:page], :per_page => 10,
            :order => sort_column.gsub(/\.nome/, '') + " " + sort_direction,
            :with => { :deleted_at => false }

          render "index"
        end
      end

      format.json do
        clientes = Cliente.search "@(nome,cpf_numero,identidade_numero,cpf_somente_numero,identidade_somente_numero) #{params[:q].gsub(/[\/-]/,'')}",
          :match_mode => :extended, :per_page => 10, :order => "nome asc",
          :with => { :deleted_at => false }

        render :json => clientes
      end
    end
  end

  def search_chosen
    respond_to do |format|
      format.json do
        clientes = Cliente.search("@(nome) #{Riddle::Query.escape(params[:data][:q])}",
          :match_mode => :extended, :star => true, :per_page => 100, :order => "nome asc",
          :with => { :deleted_at => false }).
          collect{ |cliente| {:id => cliente.id, :text => municipe.nome} }

        render :json => {:q => params[:data][:q], :results => clientes}
      end

      format.any { render "#{Rails.root.to_s}/public/404.html", :layout => false, :status => 404 }
    end
  end
end

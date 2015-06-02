# -*- encoding : utf-8 -*-
class RelatorioBase < Prawn::Document
  include ActionView::Helpers::TranslationHelper
  include ActionView::Helpers::NumberHelper

  attr_accessor :options

  RETRATO = {:page_size => 'A4', left_margin: 30, right_margin: 30, top_margin: 100, bottom_margin: 50}
  PAISAGEM = {:page_size => 'A4', left_margin: 30, right_margin: 30, top_margin: 100, bottom_margin: 50, :page_layout => :landscape}

  def to_pdf(resources, usuario, filtro_hash={}, options={})
    self.options = options

    filtros(filtro_hash)

    insert_content(resources, options)

    page_count.times do |i|
      go_to_page(i+1)
      cabecalho
      rodape(usuario, i)
    end

    render
  end

  def cabecalho
    # insere o logo do cliente
    # bounding_box([bounds.left, bounds.top + 80], :width => 100, :height => 60) do
    #   image get_logo_path, fit: [100, 60]
    # end

    bounding_box([bounds.left + 100, bounds.top + 80], :width => bounds.width - 100, :height => 60) do
      move_down(30)
      text titulo, :size => 12, :align => :center, :style => :bold
    end
  end

  def filtros(filtros_labels)
    filtros_labels.each_pair do |titulo, valor|
      text "<strong>#{titulo}:</strong> #{valor}", :inline_format => true, :size => 9
    end

    move_down 10
  end

  def rodape(usuario, i)
    bounding_box([bounds.left, bounds.bottom - 5], :width => bounds.width - 100, :height => 20) do
      text usuario.try(:nome), size: 7
      text titulo, size: 7
    end

    bounding_box([bounds.right - 100, bounds.bottom - 5], :width => 100, :height => 20) do
      text "#{i+1} / #{page_count}", align: :right, size: 7
      text Time.now.strftime("%d/%m/%Y - %H:%M"), align: :right, size: 7
    end
  end

  def tratar_valor(valor, formato=:default)
    if [Date, Time, ActiveSupport::TimeWithZone].include?(valor.class)
      valor.blank? ? "—" : l(valor, format: formato)
    else
      valor.blank? ? "—" : valor
    end
  end
end

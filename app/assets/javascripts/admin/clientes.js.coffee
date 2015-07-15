# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $("#cliente_estado").change ->
    $('#carrega_cidade').empty()
    container = $('#carrega_cidade')
    estado_id = $("#cliente_estado").val()
    valor = $(this).val()
    if valor != ""
      url = "/admin/clientes/combo_cidades?id=#{valor}"
      container.load url, ->
        $('#carrega_cidade select.select-token')

      container.show()
    else
      $('#carrega_cidade').hide()
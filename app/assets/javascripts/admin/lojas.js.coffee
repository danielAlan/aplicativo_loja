# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#localidade_estado_id').change ->
      getCitiesByState 'id=' + $('#localidade_estado_id').val()
      return
    return


window.getCitiesByState = (id) ->
  $.getJSON '/buscar_cidades', id, (j) ->
    options = '<option value="">Selecione uma Cidade...</option>'
    $.each j.cty, (i, item) ->
      options += '<option value="' + item.id + '">' + item.nome + '</option>'
      return
    $('#localidade_cidade_id').html options
    return
  return
# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'fornecedor', 'fornecedores'
  inflect.irregular 'perfil', 'perfis'
  inflect.irregular 'categoria', 'categorias'
  inflect.irregular 'album', 'albuns'
  inflect.irregular 'album_foto', 'album_fotos'
  inflect.irregular 'status_orcamento', 'status_orcamentos'
  inflect.irregular 'tipo_feriado', 'tipos_feriados'
  inflect.irregular 'feriado_cadastrado', 'feriados_cadastrados'
  inflect.irregular 'cartao_ponto_dia', 'cartao_pontos_dias'

end
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

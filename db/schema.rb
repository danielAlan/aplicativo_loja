# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150603180941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_fotos", force: true do |t|
    t.integer  "album_id",                      null: false
    t.string   "foto_file_name",                null: false
    t.string   "foto_content_type",             null: false
    t.integer  "foto_file_size",                null: false
    t.datetime "foto_updated_at",               null: false
    t.string   "comentario",        limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "album_fotos", ["album_id"], name: "index_album_fotos_on_album_id", using: :btree

  create_table "albuns", force: true do |t|
    t.integer  "categoria_id",                  null: false
    t.string   "nome",              limit: 100
    t.text     "descricao"
    t.string   "capa_file_name"
    t.string   "capa_content_type"
    t.integer  "capa_file_size"
    t.datetime "capa_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albuns", ["categoria_id"], name: "index_albuns_on_categoria_id", using: :btree

  create_table "cargos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cartao_pontos", force: true do |t|
    t.integer  "funcionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mes",            limit: 2
    t.integer  "ano"
  end

  add_index "cartao_pontos", ["funcionario_id"], name: "index_cartao_pontos_on_funcionario_id", using: :btree

  create_table "cartao_pontos_dias", force: true do |t|
    t.integer  "cartao_ponto_id"
    t.date     "data"
    t.time     "entrada"
    t.time     "almoco_saida"
    t.time     "almoco_entrada"
    t.time     "saida"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cartao_pontos_dias", ["cartao_ponto_id"], name: "index_cartao_pontos_dias_on_cartao_ponto_id", using: :btree

  create_table "categorias", force: true do |t|
    t.string   "nome",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cidades", force: true do |t|
    t.integer "estado_id"
    t.string  "uf",        limit: 10
    t.string  "nome",      limit: 50
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "clientes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome",                limit: 100
    t.string   "endereco",            limit: 100
    t.string   "telefone",            limit: 14
    t.string   "telefone_secundario", limit: 14
    t.string   "rg",                  limit: 14
    t.string   "cpf",                 limit: 14
    t.integer  "estado_id"
    t.integer  "cidade_id"
  end

  add_index "clientes", ["cidade_id"], name: "index_clientes_on_cidade_id", using: :btree
  add_index "clientes", ["estado_id"], name: "index_clientes_on_estado_id", using: :btree

  create_table "estados", force: true do |t|
    t.string "nome", limit: 50
    t.string "uf",   limit: 5
  end

  create_table "feriados_cadastrados", force: true do |t|
    t.integer "tipo_feriado_id"
    t.string  "descricao",       limit: 100
    t.string  "data",            limit: 8
  end

  add_index "feriados_cadastrados", ["tipo_feriado_id"], name: "index_feriados_cadastrados_on_tipo_feriado_id", using: :btree

  create_table "fornecedores", force: true do |t|
    t.string   "nome",                limit: 100, null: false
    t.string   "endereco",            limit: 100, null: false
    t.string   "telefone",            limit: 14
    t.string   "telefone_secundario", limit: 14
    t.string   "cnpj",                limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estado_id"
    t.integer  "cidade_id"
    t.string   "email",               limit: 50
  end

  add_index "fornecedores", ["cidade_id"], name: "index_fornecedores_on_cidade_id", using: :btree
  add_index "fornecedores", ["estado_id"], name: "index_fornecedores_on_estado_id", using: :btree

  create_table "funcionarios", force: true do |t|
    t.string   "nome",              limit: 100, null: false
    t.string   "telefone",          limit: 14
    t.string   "telefone_contato",  limit: 14
    t.string   "endereco",          limit: 100
    t.string   "rg",                limit: 14
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cargo_id"
    t.string   "email",             limit: 100
    t.integer  "estado_id"
    t.integer  "cidade_id"
    t.integer  "loja_id"
    t.date     "data_admissao"
  end

  add_index "funcionarios", ["cargo_id"], name: "index_funcionarios_on_cargo_id", using: :btree
  add_index "funcionarios", ["cidade_id"], name: "index_funcionarios_on_cidade_id", using: :btree
  add_index "funcionarios", ["estado_id"], name: "index_funcionarios_on_estado_id", using: :btree
  add_index "funcionarios", ["loja_id"], name: "index_funcionarios_on_loja_id", using: :btree

  create_table "geometry_columns", primary_key: "f_table_catalog", force: true do |t|
    t.string  "f_table_schema",    limit: 256, null: false
    t.string  "f_table_name",      limit: 256, null: false
    t.string  "f_geometry_column", limit: 256, null: false
    t.integer "coord_dimension",               null: false
    t.integer "srid",                          null: false
    t.string  "type",              limit: 30,  null: false
  end

  create_table "lojas", force: true do |t|
    t.string   "nome",                limit: 100, null: false
    t.string   "endereco",            limit: 100, null: false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "telefone",            limit: 11
    t.string   "email",               limit: 30
    t.string   "telefone_secundario", limit: 14
    t.integer  "estado_id"
    t.integer  "cidade_id"
  end

  add_index "lojas", ["cidade_id"], name: "index_lojas_on_cidade_id", using: :btree
  add_index "lojas", ["estado_id"], name: "index_lojas_on_estado_id", using: :btree

  create_table "orcamentos", force: true do |t|
    t.string   "nome",                limit: 100
    t.string   "endereco",            limit: 100
    t.string   "telefone",            limit: 14
    t.string   "telefone_contato",    limit: 14
    t.integer  "cidade_id"
    t.integer  "estado_id"
    t.string   "referencia",          limit: 100
    t.text     "descricao"
    t.integer  "status_orcamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",               limit: 100
    t.date     "data_agendamento"
    t.time     "hora_agendamento"
    t.date     "data_visita"
    t.time     "hora_visita"
  end

  add_index "orcamentos", ["cidade_id"], name: "index_orcamentos_on_cidade_id", using: :btree
  add_index "orcamentos", ["estado_id"], name: "index_orcamentos_on_estado_id", using: :btree
  add_index "orcamentos", ["status_orcamento_id"], name: "index_orcamentos_on_status_orcamento_id", using: :btree

  create_table "perfis", force: true do |t|
    t.string   "nome",       limit: 20, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", force: true do |t|
    t.string   "nome",              limit: 100
    t.string   "descricao",         limit: 100
    t.string   "recomendacao",      limit: 100
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servicos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spatial_ref_sys", primary_key: "srid", force: true do |t|
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "status_orcamentos", force: true do |t|
    t.string   "nome",       limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_feriados", force: true do |t|
    t.string "nome", limit: 100, null: false
  end

  create_table "usuarios", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "nome",                   limit: 100,              null: false
    t.integer  "perfil_id"
    t.integer  "loja_id"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["loja_id"], name: "index_usuarios_on_loja_id", using: :btree
  add_index "usuarios", ["perfil_id"], name: "index_usuarios_on_perfil_id", using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end

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

ActiveRecord::Schema.define(version: 20150520173832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cargos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "fornecedores", force: true do |t|
    t.string   "nome",                limit: 100, null: false
    t.string   "endereco",            limit: 100, null: false
    t.string   "telefone",            limit: 11
    t.string   "telefone_secundario", limit: 11
    t.string   "cnpj",                limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estado_id"
    t.integer  "cidade_id"
  end

  add_index "fornecedores", ["cidade_id"], name: "index_fornecedores_on_cidade_id", using: :btree
  add_index "fornecedores", ["estado_id"], name: "index_fornecedores_on_estado_id", using: :btree

  create_table "funcionarios", force: true do |t|
    t.string   "nome",              limit: 100, null: false
    t.string   "telefone",          limit: 11
    t.string   "telefone_contato",  limit: 11
    t.string   "endereco",          limit: 100
    t.string   "rg",                limit: 14
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cargo_id"
  end

  add_index "funcionarios", ["cargo_id"], name: "index_funcionarios_on_cargo_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome",                   limit: 100,              null: false
    t.integer  "perfil_id"
    t.integer  "loja_id"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["loja_id"], name: "index_usuarios_on_loja_id", using: :btree
  add_index "usuarios", ["perfil_id"], name: "index_usuarios_on_perfil_id", using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end

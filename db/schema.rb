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

ActiveRecord::Schema.define(version: 20160229075406) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "codigos", force: :cascade do |t|
    t.string   "codigo"
    t.boolean  "vendido"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "producto_id"
    t.integer  "pedido_id"
  end

  add_index "codigos", ["pedido_id"], name: "index_codigos_on_pedido_id"
  add_index "codigos", ["producto_id"], name: "index_codigos_on_producto_id"

  create_table "destinatarios", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entradas", force: :cascade do |t|
    t.string   "codigo"
    t.boolean  "vendido"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "producto_id"
    t.integer  "pedido_id"
  end

  add_index "entradas", ["pedido_id"], name: "index_entradas_on_pedido_id"
  add_index "entradas", ["producto_id"], name: "index_entradas_on_producto_id"

  create_table "facturas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "calle"
    t.string   "numero"
    t.string   "cp"
    t.string   "provincia"
    t.string   "localidad"
    t.string   "cif"
    t.integer  "numeroFactura"
    t.decimal  "importe"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "pedido_id"
  end

  add_index "facturas", ["pedido_id"], name: "index_facturas_on_pedido_id"

  create_table "pedidos", force: :cascade do |t|
    t.string   "mail"
    t.string   "nombre"
    t.string   "calle"
    t.string   "numero"
    t.string   "cp"
    t.string   "localidad"
    t.string   "provincia"
    t.decimal  "precio"
    t.integer  "cantidad"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "producto_id"
    t.integer  "factura_id"
    t.text     "notification_params"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "purchased_at"
  end

  add_index "pedidos", ["factura_id"], name: "index_pedidos_on_factura_id"
  add_index "pedidos", ["producto_id"], name: "index_pedidos_on_producto_id"

  create_table "productos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "titular"
    t.string   "descripcion"
    t.string   "imagen"
    t.decimal  "precio"
    t.string   "estado"
    t.integer  "stock"
    t.string   "tipoProducto"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

end

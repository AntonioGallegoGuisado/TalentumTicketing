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

ActiveRecord::Schema.define(version: 20160222115053) do

  create_table "codigos", force: :cascade do |t|
    t.string   "Codigo"
    t.boolean  "Vendido"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "productos_id"
  end

  add_index "codigos", ["productos_id"], name: "index_codigos_on_productos_id"

  create_table "entradas", force: :cascade do |t|
    t.string   "Codigo"
    t.boolean  "Vendido"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "productos_id"
  end

  add_index "entradas", ["productos_id"], name: "index_entradas_on_productos_id"

  create_table "facturas", force: :cascade do |t|
    t.string   "Nombre"
    t.string   "Calle"
    t.string   "Numero"
    t.integer  "CP"
    t.string   "Provincia"
    t.string   "Localidad"
    t.string   "CIF"
    t.decimal  "NumeroFactura"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "pedidos_id"
  end

  add_index "facturas", ["pedidos_id"], name: "index_facturas_on_pedidos_id"

  create_table "pedidos", force: :cascade do |t|
    t.string   "Usuario"
    t.string   "Mail"
    t.decimal  "Precio"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "facturas_id"
  end

  add_index "pedidos", ["facturas_id"], name: "index_pedidos_on_facturas_id"

  create_table "productos", force: :cascade do |t|
    t.string   "Nombre"
    t.string   "Titular"
    t.string   "Descripcion"
    t.string   "Imagen"
    t.decimal  "Precio"
    t.string   "Estado"
    t.integer  "Iniciales"
    t.integer  "Disponibles"
    t.string   "TipoProducto"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "pedidos_id"
  end

  add_index "productos", ["pedidos_id"], name: "index_productos_on_pedidos_id"

end

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

ActiveRecord::Schema.define(version: 20170911185226) do

  create_table "articulos", force: :cascade do |t|
    t.string   "descripcion", limit: 100
    t.string   "modelo",      limit: 50
    t.decimal  "precio",                  precision: 10, scale: 2
    t.integer  "existencia"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nom_cliente", limit: 50
    t.string   "ap_paterno",  limit: 50
    t.string   "ap_materno",  limit: 50
    t.string   "rfc",         limit: 13
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "configuracions", force: :cascade do |t|
    t.decimal  "tasa",         precision: 10, scale: 2
    t.decimal  "prc_enganche", precision: 10, scale: 2
    t.integer  "plazo_maximo"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "rel_venta_articulos", force: :cascade do |t|
    t.integer  "venta_id"
    t.integer  "articulo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "cantidad"
  end

  create_table "users", force: :cascade do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "ventas", force: :cascade do |t|
    t.integer  "cliente_id"
    t.decimal  "enganche",     precision: 10, scale: 2
    t.decimal  "total",        precision: 10, scale: 2
    t.decimal  "bonificacion", precision: 10, scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "plazo_meses"
  end

end

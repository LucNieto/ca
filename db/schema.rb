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


ActiveRecord::Schema.define(version: 20170419213808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "careers", force: :cascade do |t|
    t.integer  "faculty_id"
    t.string   "nombre_carrera"
    t.string   "nombre_abbr"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["faculty_id"], name: "index_careers_on_faculty_id", using: :btree
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "nombre_facultad"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "clave_grupo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end


  create_table "period_has_subjects", force: :cascade do |t|
    t.integer  "period_id"
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.boolean  "lunes"
    t.boolean  "martes"
    t.boolean  "miercoles"
    t.boolean  "jueves"
    t.boolean  "viernes"
    t.boolean  "sabado"
    t.string   "horario_clases"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["period_id"], name: "index_period_has_subjects_on_period_id", using: :btree
    t.index ["subject_id"], name: "index_period_has_subjects_on_subject_id", using: :btree
    t.index ["teacher_id"], name: "index_period_has_subjects_on_teacher_id", using: :btree
  end

  create_table "periods", force: :cascade do |t|
    t.integer  "school_cycle_id"
    t.string   "nombre_periodo"
    t.integer  "period_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["school_cycle_id"], name: "index_periods_on_school_cycle_id", using: :btree
  end

  create_table "school_cycles", force: :cascade do |t|
    t.integer  "career_id"
    t.string   "nombre_ciclo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["career_id"], name: "index_school_cycles_on_career_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "nombre_materia"
    t.integer  "subject_type"
    t.string   "clave_materia"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["group_id"], name: "index_subjects_on_group_id", using: :btree
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "grado"
    t.string   "correo_electronico"
    t.string   "telefono"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "nombre"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.integer  "user_type",              default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "careers", "faculties"
  add_foreign_key "period_has_subjects", "periods"
  add_foreign_key "period_has_subjects", "subjects"
  add_foreign_key "period_has_subjects", "teachers"
  add_foreign_key "periods", "school_cycles"
  add_foreign_key "school_cycles", "careers"
  add_foreign_key "subjects", "groups"
end

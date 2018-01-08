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

ActiveRecord::Schema.define(version: 20171213004734) do

  create_table "calendarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "nombre"
    t.string   "registro"
    t.string   "examen_colocacion"
    t.string   "inicio_curso"
    t.string   "examen_medio"
    t.string   "examen_final"
    t.string   "entrega_boletas"
    t.string   "suspension_labores"
    t.string   "vacaciones"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "periodo"
    t.string   "anio"
    t.string   "estado"
  end

  create_table "centros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "direccion"
    t.string   "telefono"
    t.string   "extension"
    t.string   "lugar"
  end

  create_table "clave_catalogos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuota", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.decimal  "cuota",      precision: 6, scale: 1
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "cuota_cursos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "descripcion"
  end

  create_table "curriculums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "calle"
    t.string   "colonia"
    t.string   "municipui"
    t.string   "entidad"
    t.string   "correo"
    t.string   "telefono"
    t.string   "celular"
    t.string   "lugar"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.integer  "user_id"
    t.string   "nombre"
    t.string   "paterno"
    t.string   "materno"
    t.index ["user_id"], name: "index_curriculums_on_user_id", using: :btree
  end

  create_table "curso_nombres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "datos_bancos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.string   "cuenta"
    t.string   "referencia"
    t.string   "titular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estados", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examen_colocacion_idiomas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.string   "paterno"
    t.string   "materno"
    t.string   "idioma"
    t.string   "nivel_asignado"
    t.string   "examinador"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.integer  "user_id"
    t.string   "procedencia"
    t.string   "anio"
    t.string   "curso"
    t.index ["user_id"], name: "index_examen_colocacion_idiomas_on_user_id", using: :btree
  end

  create_table "fr_inscripcion_registros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.string   "paterno"
    t.string   "materno"
    t.string   "idioma"
    t.string   "horario"
    t.string   "nivel"
    t.string   "curso"
    t.string   "opcion_uno"
    t.string   "opcion_dos"
    t.string   "telefono"
    t.string   "periodo"
    t.string   "correo"
    t.string   "sexo"
    t.string   "cuota"
    t.string   "movimiento"
    t.string   "procedencia"
    t.integer  "grupo_id"
    t.integer  "examen_medio"
    t.integer  "examen_final"
    t.boolean  "documentos_validados"
    t.string   "boleta"
    t.string   "oferta_grupo"
    t.integer  "user_id"
    t.boolean  "habilitar_constancia"
    t.boolean  "habilitar_historial"
    t.string   "oficio_prestacion"
    t.string   "monto_pagado"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.index ["grupo_id"], name: "index_fr_inscripcion_registros_on_grupo_id", using: :btree
    t.index ["user_id"], name: "index_fr_inscripcion_registros_on_user_id", using: :btree
  end

  create_table "generos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "genero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grupos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "nombre"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "horario"
    t.string   "idioma"
    t.string   "nivel"
    t.string   "estado"
    t.string   "curso"
    t.string   "anio"
    t.string   "periodo"
    t.integer  "user_id"
    t.string   "lugar"
    t.string   "fecha"
    t.string   "centro"
    t.string   "tipo"
    t.string   "modalidad"
    t.string   "cupo"
    t.string   "duracion"
    t.string   "cuota"
    t.string   "clave"
    t.string   "proyecto"
    t.string   "institucion_bancaria"
    t.string   "cuenta"
    t.string   "titular"
    t.string   "instructor"
    t.string   "instructor_rfc"
    t.string   "instructor_correo"
    t.string   "jefe_ec"
    t.string   "registro"
    t.string   "referencia"
    t.boolean  "habilitar_constancias_grupo"
    t.string   "seccion"
    t.index ["user_id"], name: "index_grupos_on_user_id", using: :btree
  end

  create_table "grupos_unitarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.string   "horario"
    t.string   "estado"
    t.string   "anio"
    t.string   "periodo"
    t.string   "lugar"
    t.string   "fecha"
    t.string   "centro"
    t.string   "tipo"
    t.string   "modalidad"
    t.string   "cupo"
    t.string   "duracion"
    t.string   "cuota"
    t.string   "clave"
    t.string   "proyecto"
    t.string   "institucion_bancaria"
    t.string   "cuenta"
    t.string   "titular"
    t.string   "jefe_ec"
    t.string   "registro"
    t.string   "referencia"
    t.boolean  "habilitar_constancias_grupo"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "seccion"
  end

  create_table "horarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "hora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "idiomas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "idioma"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inscripcion_registros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "nombre"
    t.string   "idioma"
    t.string   "horario"
    t.string   "nivel"
    t.string   "curso"
    t.string   "opcion_uno"
    t.string   "opcion_dos"
    t.string   "telefono"
    t.string   "periodo"
    t.string   "correo"
    t.string   "sexo"
    t.string   "cuota"
    t.string   "movimiento"
    t.string   "procedencia"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "grupo_id"
    t.integer  "examen_medio"
    t.integer  "examen_final"
    t.string   "paterno"
    t.string   "materno"
    t.boolean  "documentos_validados"
    t.string   "boleta"
    t.string   "oferta_grupo"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.integer  "user_id"
    t.boolean  "habilitar_constancia"
    t.boolean  "habilitar_historial"
    t.string   "oficio_prestacion"
    t.string   "monto_pagado"
    t.index ["grupo_id"], name: "index_inscripcion_registros_on_grupo_id", using: :btree
    t.index ["user_id"], name: "index_inscripcion_registros_on_user_id", using: :btree
  end

  create_table "it_inscripcion_registros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.string   "paterno"
    t.string   "materno"
    t.string   "idioma"
    t.string   "horario"
    t.string   "nivel"
    t.string   "curso"
    t.string   "opcion_uno"
    t.string   "opcion_dos"
    t.string   "telefono"
    t.string   "periodo"
    t.string   "correo"
    t.string   "sexo"
    t.string   "cuota"
    t.string   "movimiento"
    t.string   "procedencia"
    t.integer  "grupo_id"
    t.integer  "examen_medio"
    t.integer  "examen_final"
    t.boolean  "documentos_validados"
    t.string   "boleta"
    t.string   "oferta_grupo"
    t.integer  "user_id"
    t.boolean  "habilitar_constancia"
    t.boolean  "habilitar_historial"
    t.string   "oficio_prestacion"
    t.string   "monto_pagado"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.index ["grupo_id"], name: "index_it_inscripcion_registros_on_grupo_id", using: :btree
    t.index ["user_id"], name: "index_it_inscripcion_registros_on_user_id", using: :btree
  end

  create_table "lugar_nombres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modalidad_oferta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nivel_nombres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "nivel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "numero_registros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "procedencia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "procedencia"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "proyectos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registro_cursos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.string   "horas"
    t.string   "periodo"
    t.string   "temas"
    t.string   "instructor"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "horario"
    t.string   "registro"
    t.string   "tipo_oferta"
    t.string   "modalidad"
    t.string   "cupo"
    t.string   "cuota"
    t.string   "clave_catalogo"
    t.string   "proyecto"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "seccion_nombres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_oferta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unitarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "curp"
    t.string   "nombre"
    t.string   "paterno"
    t.string   "materno"
    t.string   "sexo"
    t.string   "nacimiento"
    t.string   "domicilio"
    t.string   "codigo_postal"
    t.string   "entidad"
    t.string   "delegacion_municipio"
    t.string   "telefono_celular"
    t.string   "telefono_fijo"
    t.string   "correo"
    t.string   "procedencia"
    t.string   "nombre_padre"
    t.string   "correo_padre"
    t.string   "telefono_padre"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "grupos_unitario_id"
    t.boolean  "documentos_validados"
    t.string   "examen_final"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "familiar_ipn"
    t.string   "nombre_ipn"
    t.string   "unidad_ipn"
    t.string   "parentesco_ipn"
    t.string   "bachillerato_ipn"
    t.boolean  "solicito_beca"
    t.datetime "fecha_validacion"
    t.index ["grupos_unitario_id"], name: "index_unitarios_on_grupos_unitario_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "nombre"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "paterno"
    t.string   "materno"
    t.string   "rfc"
    t.integer  "centro_id"
    t.string   "matricula"
    t.index ["centro_id"], name: "index_users_on_centro_id", using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "item_type",      limit: 191,        null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 4294967295
    t.datetime "created_at"
    t.text     "object_changes", limit: 65535
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "curriculums", "users"
  add_foreign_key "examen_colocacion_idiomas", "users"
  add_foreign_key "fr_inscripcion_registros", "grupos"
  add_foreign_key "fr_inscripcion_registros", "users"
  add_foreign_key "grupos", "users"
  add_foreign_key "inscripcion_registros", "grupos"
  add_foreign_key "inscripcion_registros", "users"
  add_foreign_key "it_inscripcion_registros", "grupos"
  add_foreign_key "it_inscripcion_registros", "users"
  add_foreign_key "unitarios", "grupos_unitarios"
  add_foreign_key "users", "centros"
  add_foreign_key "users", "roles"
end

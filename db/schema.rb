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

ActiveRecord::Schema.define(version: 20171020215939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "descricao", null: false
    t.bigint "user_id", null: false
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "answer_id"
    t.index ["answer_id"], name: "index_answers_on_answer_id"
    t.index ["topic_id"], name: "index_answers_on_topic_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer "max_users"
    t.string "titulo"
    t.text "descricao"
    t.string "prazo"
    t.decimal "total_hours"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", limit: 2, default: 0
    t.datetime "datainicio"
    t.datetime "datafim"
    t.string "documentation_file_name"
    t.string "documentation_content_type"
    t.integer "documentation_file_size"
    t.datetime "documentation_updated_at"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "subcategories", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_submissions_on_project_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "topics", id: :serial, force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.integer "user_id"
    t.integer "status", limit: 2, default: 0
    t.integer "tipo"
    t.integer "category_id"
    t.integer "subcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_topics_on_category_id"
    t.index ["subcategory_id"], name: "index_topics_on_subcategory_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "universidades", force: :cascade do |t|
    t.string "matricula"
    t.string "nome"
    t.string "sobrenome"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "matricula", default: "0", null: false
    t.string "nome"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "access"
    t.string "sobrenome"
    t.string "cpf"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "answers"
  add_foreign_key "answers", "topics"
  add_foreign_key "answers", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "submissions", "projects"
  add_foreign_key "submissions", "users"
  add_foreign_key "topics", "categories"
  add_foreign_key "topics", "subcategories"
  add_foreign_key "topics", "users"
end

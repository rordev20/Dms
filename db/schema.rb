# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_12_27_152356) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "punches", force: :cascade do |t|
    t.bigint "sub_task_id", null: false
    t.datetime "punch_in"
    t.datetime "punch_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_task_id"], name: "index_punches_on_sub_task_id"
  end

  create_table "sprints", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_tasks", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "sprint_id", null: false
    t.text "description"
    t.integer "planned_hour", default: 0
    t.integer "planned_minute", default: 0
    t.string "task_timing"
    t.integer "actual_hour", default: 0
    t.integer "actual_minute", default: 0
    t.string "official_documentation"
    t.string "video_link"
    t.datetime "activity_date", default: "2024-12-29 17:12:58"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sprint_id"], name: "index_sub_tasks_on_sprint_id"
    t.index ["task_id"], name: "index_sub_tasks_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "official_documentation"
    t.string "video_link"
    t.integer "total_hours"
    t.integer "total_minutes"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_tables", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "sprint_id", null: false
    t.text "description"
    t.integer "planned_hour"
    t.integer "planned_minute"
    t.string "task_timing"
    t.string "official_documentation"
    t.string "video_link"
    t.integer "day_type"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sprint_id"], name: "index_time_tables_on_sprint_id"
    t.index ["task_id"], name: "index_time_tables_on_task_id"
  end

  add_foreign_key "punches", "sub_tasks"
  add_foreign_key "sub_tasks", "sprints"
  add_foreign_key "sub_tasks", "tasks"
  add_foreign_key "time_tables", "sprints"
  add_foreign_key "time_tables", "tasks"
end

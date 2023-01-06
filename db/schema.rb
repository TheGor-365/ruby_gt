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

ActiveRecord::Schema[7.0].define(version: 2023_01_06_191850) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "command_codes", force: :cascade do |t|
    t.string "title"
    t.string "overview"
    t.text "code"
    t.text "description"
    t.string "path"
    t.bigint "lang_id", null: false
    t.bigint "command_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["command_id"], name: "index_command_codes_on_command_id"
    t.index ["lang_id"], name: "index_command_codes_on_lang_id"
  end

  create_table "commands", force: :cascade do |t|
    t.string "title"
    t.string "overview"
    t.text "body"
    t.text "description"
    t.string "path"
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "command_codes_count", default: 0, null: false
    t.index ["language_id"], name: "index_commands_on_language_id"
  end

  create_table "example_codes", force: :cascade do |t|
    t.string "title"
    t.string "overview"
    t.text "code"
    t.text "description"
    t.string "path"
    t.bigint "lang_id", null: false
    t.bigint "example_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["example_id"], name: "index_example_codes_on_example_id"
    t.index ["lang_id"], name: "index_example_codes_on_lang_id"
  end

  create_table "examples", force: :cascade do |t|
    t.string "title"
    t.string "overview"
    t.text "body"
    t.text "description"
    t.string "path"
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "example_codes_count"
    t.index ["language_id"], name: "index_examples_on_language_id"
  end

  create_table "guide_codes", force: :cascade do |t|
    t.text "code"
    t.string "overview"
    t.text "description"
    t.bigint "guide_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lang_id", null: false
    t.string "path"
    t.index ["guide_id"], name: "index_guide_codes_on_guide_id"
    t.index ["lang_id"], name: "index_guide_codes_on_lang_id"
  end

  create_table "guides", force: :cascade do |t|
    t.string "title"
    t.string "overview"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "language_id", null: false
    t.text "description"
    t.string "path"
    t.integer "guide_codes_count", default: 0, null: false
    t.index ["language_id"], name: "index_guides_on_language_id"
  end

  create_table "langs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_langs_on_name"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_languages_on_name"
  end

  create_table "snippet_codes", force: :cascade do |t|
    t.text "code"
    t.string "path"
    t.string "overview"
    t.text "description"
    t.bigint "lang_id", null: false
    t.bigint "snippet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lang_id"], name: "index_snippet_codes_on_lang_id"
    t.index ["snippet_id"], name: "index_snippet_codes_on_snippet_id"
  end

  create_table "snippets", force: :cascade do |t|
    t.string "title"
    t.string "overview"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "language_id", null: false
    t.text "description"
    t.string "path"
    t.integer "snippet_codes_count", default: 0, null: false
    t.index ["language_id"], name: "index_snippets_on_language_id"
  end

  create_table "taggable_commands", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "command_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["command_id"], name: "index_taggable_commands_on_command_id"
    t.index ["tag_id"], name: "index_taggable_commands_on_tag_id"
  end

  create_table "taggable_examples", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "example_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["example_id"], name: "index_taggable_examples_on_example_id"
    t.index ["tag_id"], name: "index_taggable_examples_on_tag_id"
  end

  create_table "taggable_guides", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "guide_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guide_id"], name: "index_taggable_guides_on_guide_id"
    t.index ["tag_id"], name: "index_taggable_guides_on_tag_id"
  end

  create_table "taggable_templates", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggable_templates_on_tag_id"
    t.index ["template_id"], name: "index_taggable_templates_on_template_id"
  end

  create_table "taggable_tutorials", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "tutorial_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggable_tutorials_on_tag_id"
    t.index ["tutorial_id"], name: "index_taggable_tutorials_on_tutorial_id"
  end

  create_table "taggables", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "snippet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["snippet_id"], name: "index_taggables_on_snippet_id"
    t.index ["tag_id"], name: "index_taggables_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name"
  end

  create_table "template_codes", force: :cascade do |t|
    t.string "title"
    t.string "overview"
    t.text "code"
    t.text "description"
    t.string "path"
    t.bigint "lang_id", null: false
    t.bigint "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lang_id"], name: "index_template_codes_on_lang_id"
    t.index ["template_id"], name: "index_template_codes_on_template_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "title"
    t.string "overview"
    t.text "body"
    t.text "description"
    t.string "path"
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "template_codes_count"
    t.index ["language_id"], name: "index_templates_on_language_id"
  end

  create_table "tutorial_codes", force: :cascade do |t|
    t.string "title"
    t.string "overview"
    t.text "code"
    t.text "description"
    t.string "path"
    t.bigint "lang_id", null: false
    t.bigint "tutorial_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lang_id"], name: "index_tutorial_codes_on_lang_id"
    t.index ["tutorial_id"], name: "index_tutorial_codes_on_tutorial_id"
  end

  create_table "tutorials", force: :cascade do |t|
    t.string "title"
    t.string "overview"
    t.text "body"
    t.text "description"
    t.string "path"
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tutorial_codes_count"
    t.index ["language_id"], name: "index_tutorials_on_language_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "command_codes", "commands"
  add_foreign_key "command_codes", "langs"
  add_foreign_key "commands", "languages"
  add_foreign_key "example_codes", "examples"
  add_foreign_key "example_codes", "langs"
  add_foreign_key "examples", "languages"
  add_foreign_key "guide_codes", "guides"
  add_foreign_key "guide_codes", "langs"
  add_foreign_key "guides", "languages"
  add_foreign_key "snippet_codes", "langs"
  add_foreign_key "snippet_codes", "snippets"
  add_foreign_key "snippets", "languages"
  add_foreign_key "taggable_commands", "commands"
  add_foreign_key "taggable_commands", "tags"
  add_foreign_key "taggable_examples", "examples"
  add_foreign_key "taggable_examples", "tags"
  add_foreign_key "taggable_guides", "guides"
  add_foreign_key "taggable_guides", "tags"
  add_foreign_key "taggable_templates", "tags"
  add_foreign_key "taggable_templates", "templates"
  add_foreign_key "taggable_tutorials", "tags"
  add_foreign_key "taggable_tutorials", "tutorials"
  add_foreign_key "taggables", "snippets"
  add_foreign_key "taggables", "tags"
  add_foreign_key "template_codes", "langs"
  add_foreign_key "template_codes", "templates"
  add_foreign_key "templates", "languages"
  add_foreign_key "tutorial_codes", "langs"
  add_foreign_key "tutorial_codes", "tutorials"
  add_foreign_key "tutorials", "languages"
end

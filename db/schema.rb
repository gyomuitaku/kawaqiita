ActiveRecord::Schema.define(version: 2020_10_31_073719) do

  create_table "results", force: :cascade do |t|
    t.integer "user_id"
    t.string "word", null: false
    t.string "meaning", null: false
    t.boolean "is_correct", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "word_sets", force: :cascade do |t|
    t.string "word_first"
    t.string "word_second"
    t.string "word_third"
    t.string "word_forth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

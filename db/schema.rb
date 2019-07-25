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

ActiveRecord::Schema.define(version: 2019_07_25_064029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.integer "author_id"
    t.string "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "authentications", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "badges", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "context"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.float "average_rating"
    t.string "report"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "dish_affections", id: :serial, force: :cascade do |t|
    t.integer "favouriter_id"
    t.integer "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_dish_affections_on_dish_id"
    t.index ["favouriter_id", "dish_id"], name: "index_dish_affections_on_favouriter_id_and_dish_id", unique: true
    t.index ["favouriter_id"], name: "index_dish_affections_on_favouriter_id"
  end

  create_table "dish_likes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", id: :serial, force: :cascade do |t|
    t.integer "restaurant_id"
    t.string "name"
    t.decimal "price", precision: 5, scale: 2
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "user_rating"
    t.integer "image_id"
    t.integer "no_of_followers"
    t.integer "no_of_dishes"
    t.float "avg_rating"
    t.index ["restaurant_id"], name: "index_dishes_on_restaurant_id"
  end

  create_table "dishes_users", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "reposted", default: false
    t.index ["dish_id"], name: "index_dishes_users_on_dish_id"
    t.index ["user_id"], name: "index_dishes_users_on_user_id"
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "attachable_id"
    t.string "attachable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "image_processing", default: false
    t.string "local_image_file_name"
    t.string "local_image_content_type"
    t.integer "local_image_file_size"
    t.datetime "local_image_updated_at"
  end

  create_table "ratings", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "dish_id"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_ratings_on_dish_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "restaurant_affections", id: :serial, force: :cascade do |t|
    t.integer "favouriter_id"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favouriter_id", "restaurant_id"], name: "index_restaurant_affections_on_favouriter_id_and_restaurant_id", unique: true
    t.index ["favouriter_id"], name: "index_restaurant_affections_on_favouriter_id"
    t.index ["restaurant_id"], name: "index_restaurant_affections_on_restaurant_id"
  end

  create_table "restaurant_fellowships", id: :serial, force: :cascade do |t|
    t.integer "follower_id"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "restaurant_id"], name: "index_restaurant_fellowships_on_follower_id_and_restaurant_id", unique: true
    t.index ["follower_id"], name: "index_restaurant_fellowships_on_follower_id"
    t.index ["restaurant_id"], name: "index_restaurant_fellowships_on_restaurant_id"
  end

  create_table "restaurants", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "google_place_id"
    t.float "latitude"
    t.float "longitude"
    t.string "website"
    t.float "rating"
    t.string "city"
  end

  create_table "rpush_apps", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "environment"
    t.text "certificate"
    t.string "password"
    t.integer "connections", default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type", null: false
    t.string "auth_key"
    t.string "client_id"
    t.string "client_secret"
    t.string "access_token"
    t.datetime "access_token_expiration"
  end

  create_table "rpush_feedback", id: :serial, force: :cascade do |t|
    t.string "device_token", limit: 64, null: false
    t.datetime "failed_at", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "app_id"
    t.index ["device_token"], name: "index_rpush_feedback_on_device_token"
  end

  create_table "rpush_notifications", id: :serial, force: :cascade do |t|
    t.integer "badge"
    t.string "device_token", limit: 64
    t.string "sound"
    t.text "alert"
    t.text "data"
    t.integer "expiry", default: 86400
    t.boolean "delivered", default: false, null: false
    t.datetime "delivered_at"
    t.boolean "failed", default: false, null: false
    t.datetime "failed_at"
    t.integer "error_code"
    t.text "error_description"
    t.datetime "deliver_after"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "alert_is_json", default: false, null: false
    t.string "type", null: false
    t.string "collapse_key"
    t.boolean "delay_while_idle", default: false, null: false
    t.text "registration_ids"
    t.integer "app_id", null: false
    t.integer "retries", default: 0
    t.string "uri"
    t.datetime "fail_after"
    t.boolean "processing", default: false, null: false
    t.integer "priority"
    t.text "url_args"
    t.string "category"
    t.boolean "content_available", default: false, null: false
    t.text "notification"
    t.boolean "mutable_content", default: false, null: false
    t.string "external_device_id"
    t.index ["delivered", "failed", "processing", "deliver_after", "created_at"], name: "index_rpush_notifications_multi", where: "((NOT delivered) AND (NOT failed))"
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.text "share_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "google_places_api"
    t.string "google_maps_api"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.text "endpoint"
    t.text "p256dh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.integer "tagger_id"
    t.string "tagger_type"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.integer "count"
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "user_fellowships", id: :serial, force: :cascade do |t|
    t.integer "follower_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "user_id"], name: "index_user_fellowships_on_follower_id_and_user_id", unique: true
    t.index ["follower_id"], name: "index_user_fellowships_on_follower_id"
    t.index ["user_id"], name: "index_user_fellowships_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "activation_token"
    t.string "authentication_token"
    t.boolean "activated", default: false
    t.string "reset_password_token"
    t.datetime "activated_at"
    t.datetime "reset_password_token_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "no_of_post"
    t.integer "no_of_followers"
    t.integer "no_of_following"
    t.string "device_id"
    t.boolean "fav_restaurant", default: true
    t.boolean "fav_dish", default: true
    t.boolean "post_by_follow_user", default: true
    t.boolean "starts_following", default: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "authentications", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "dish_affections", "dishes"
  add_foreign_key "ratings", "dishes"
  add_foreign_key "ratings", "users"
  add_foreign_key "restaurant_affections", "restaurants"
  add_foreign_key "restaurant_fellowships", "restaurants"
  add_foreign_key "user_fellowships", "users"
end

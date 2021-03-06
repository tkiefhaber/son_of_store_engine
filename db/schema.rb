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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120502010734) do

  create_table "addresses", :force => true do |t|
    t.string   "street_1"
    t.string   "street_2"
    t.string   "zip_code"
    t.string   "city"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "name"
    t.integer  "visitor_user_id"
  end

  create_table "cart_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "quantity",   :default => 1
  end

  add_index "cart_items", ["product_id", "cart_id"], :name => "index_cart_items_on_product_id_and_cart_id"

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "store_id"
  end

  add_index "carts", ["store_id"], :name => "index_carts_on_store_id"
  add_index "carts", ["user_id"], :name => "index_carts_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "store_id"
  end

  add_index "categories", ["store_id"], :name => "index_categories_on_store_id"

  create_table "order_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.decimal  "unit_price", :precision => 12, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "order_items", ["product_id", "order_id"], :name => "index_order_items_on_product_id_and_order_id"

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "total_price",     :precision => 12, :scale => 2
    t.integer  "address_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "status"
    t.integer  "store_id"
    t.integer  "visitor_user_id"
    t.string   "unique_url"
  end

  add_index "orders", ["store_id"], :name => "index_orders_on_store_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "privileges", :force => true do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "privileges", ["store_id"], :name => "index_privileges_on_store_id"
  add_index "privileges", ["user_id"], :name => "index_privileges_on_user_id"

  create_table "product_categories", :force => true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "activity",                                   :default => true
    t.decimal  "price",       :precision => 12, :scale => 2
    t.string   "image_link"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.integer  "store_id"
  end

  add_index "products", ["store_id"], :name => "index_products_on_store_id"

  create_table "searches", :force => true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "owner_id"
    t.text     "description"
    t.string   "status",      :default => "pending"
  end

  create_table "users", :force => true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "username"
    t.boolean  "admin",           :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "stripe_id"
    t.string   "display_name"
  end

  create_table "visitor_users", :force => true do |t|
    t.string   "email"
    t.string   "stripe_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

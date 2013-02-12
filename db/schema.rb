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

ActiveRecord::Schema.define(:version => 20130207183432) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string "first_name",          :null => false
    t.string "middle_name"
    t.string "last_name",           :null => false
    t.string "address",             :null => false
    t.string "province",            :null => false
    t.string "telephone_number"
    t.string "email"
    t.string "customer_type",       :null => false
    t.string "registration_number", :null => false
    t.float  "initial_credit"
    t.float  "remaining_credit"
    t.string "sales_assistant"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",    :default => 0
    t.integer  "customer_id"
  end

  create_table "orders", :force => true do |t|
    t.integer "transaction_id"
    t.integer "product_id",     :null => false
    t.integer "quantity",       :null => false
    t.float   "cost",           :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "customer_id", :null => false
    t.float    "amount",      :null => false
    t.datetime "paid_date",   :null => false
  end

  create_table "products", :force => true do |t|
    t.string  "description",        :null => false
    t.string  "product_type",       :null => false
    t.integer "remaining_quantity"
    t.float   "rate",               :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "customer_id", :null => false
    t.datetime "order_date",  :null => false
    t.float    "total_cost",  :null => false
    t.boolean  "paid"
  end

end

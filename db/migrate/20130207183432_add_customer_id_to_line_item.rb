class AddCustomerIdToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :customer_id, :integer
  end
end

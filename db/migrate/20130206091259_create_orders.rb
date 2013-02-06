class CreateOrders < ActiveRecord::Migration
  def up
  	create_table 'orders' do |t|
  		t.integer 'transaction_id'
  		t.integer 'product_id', :null => false
  		t.integer 'quantity', :null => false
  		t.float 'cost', :null => false
  	end

  end

  def down
  	drop_table 'orders'
  end
end

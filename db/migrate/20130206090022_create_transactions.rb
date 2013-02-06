class CreateTransactions < ActiveRecord::Migration
  def up
  	create_table 'transactions' do |t|
  		t.integer 'customer_id', :null => false
  		t.datetime 'order_date', :null => false
  		t.float 'total_cost', :null =>false
      t.boolean 'paid'
  	end
  end

  def down
  	drop_table 'transactions'
  end
end

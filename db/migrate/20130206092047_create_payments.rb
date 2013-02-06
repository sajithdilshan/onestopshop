class CreatePayments < ActiveRecord::Migration
  def up
  	create_table 'payments' do |t|
  		t.integer 'customer_id', :null => false
  		t.float 'amount', :null => false
  		t.datetime 'paid_date', :null => false
  	end
  end

  def down
  	drop_table 'payments'
  end
end

class CreateCustomers < ActiveRecord::Migration
  def up
  	create_table 'customers' do |t|
  		t.string 'first_name', :null => false
  		t.string 'middle_name' 
  		t.string 'last_name', :null => false
  		t.string 'address', :null => false
  		t.string 'province', :null =>false
  		t.string 'telephone_number'
  		t.string 'email'
  		t.string 'customer_type', :null =>false
      t.string 'registration_number', :null => false
      t.float 'initial_credit'
      t.float 'remaining_credit'
      t.string 'sales_assistant'
  	end
  end

  def down
  	drop_table 'customers'
  end
end

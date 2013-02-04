class CreateProducts < ActiveRecord::Migration
  def up
  	create_table 'products' do |t|
  		t.string 'description', :null => false
  		t.string 'product_type', :null => false
  		t.integer 'remaining_quantity'
  		t.float 'rate', :null => false
  	end
  end

  def down
  	drop_table 'products'
  end
end

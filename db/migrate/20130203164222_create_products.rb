class CreateProducts < ActiveRecord::Migration
  def up
  	create_table 'products' do |t|
  		t.text 'description'
  		t.string 'product_type'
  		t.integer 'remaining_quantity'
  		t.float 'rate'
  	end
  end

  def down
  	drop_table 'products'
  end
end

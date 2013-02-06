class Order < ActiveRecord::Base
	validates :product_id, :presence => true
	validates :quantity, :presence => true
	validates :cost, :presence => true

	def self.search_orders(column, search)
	  if search and column
	    find(:all, :conditions => ["#{column} LIKE ?", "%#{search}%"])
	  else
	    return nil
	  end
	end

end
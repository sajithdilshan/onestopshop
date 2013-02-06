class Product < ActiveRecord::Base
	validates :description, :presence => true
	validates :product_type, :presence => true
	validates :remaining_quantity, :presence => true
	validates :rate, :presence => true
	self.per_page = 15

	def self.search_products(column, search)
	  if search and column
	    find(:all, :conditions => ["#{column} LIKE ?", "%#{search}%"])
	  else
	    return nil
	  end
	end
end

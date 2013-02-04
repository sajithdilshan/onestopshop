class Product < ActiveRecord::Base
	validates :description, :presence => true
	validates :product_type, :presence => true
	validates :remaining_quantity, :presence => true
	validates :rate, :presence => true
	self.per_page = 25

end

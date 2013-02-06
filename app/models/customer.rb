class Customer < ActiveRecord::Base
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :address, :presence => true
	validates :province, :presence => true
	validates :customer_type, :presence => true
	validates :registration_number, :presence => true
	self.per_page = 25

	def self.search_customers(column, search)
	  if search and column
	    find(:all, :conditions => ["#{column} LIKE ?", "%#{search}%"])
	  else
	    return nil
	  end
	end
end
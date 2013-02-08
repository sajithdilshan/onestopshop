class Customer < ActiveRecord::Base
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :address, :presence => true
	validates :province, :presence => true
	validates :customer_type, :presence => true
	validates :registration_number, :presence => true, :uniqueness => true
	# self.per_page = 20
	def self.search_customers(column, search, page, p_page)
	  if search and column
	  	paginate :per_page => p_page, :page => page, :conditions => ["#{column} LIKE ?", "%#{search}%"], :order => column
	  else
	    return nil
	  end
	end
end
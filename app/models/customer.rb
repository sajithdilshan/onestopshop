class Customer < ActiveRecord::Base
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :address, :presence => true
	validates :province, :presence => true
	validates :customer_type, :presence => true
	validates :registration_number, :presence => true
	self.per_page = 25

end
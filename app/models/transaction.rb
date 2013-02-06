class Transaction < ActiveRecord::Base
	validates :customer_id, :presence => true
	validates :order_date, :presence => true
	validates :total_cost, :presence => true

	def self.search_transactions(column, search)
	  if search and column
	    find(:all, :conditions => ["#{column} LIKE ?", "%#{search}%"])
	  else
	    return nil
	  end
	end

end

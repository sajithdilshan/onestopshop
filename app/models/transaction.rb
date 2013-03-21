class Transaction < ActiveRecord::Base
	validates :customer_id, :presence => true
	validates :order_date, :presence => true
	validates :total_cost, :presence => true
	# self.per_page = 20

	def self.search_transactions(column, search,page,p_page)
		if search and column
			paginate :per_page => p_page, :page => page, :conditions => ["CAST(#{column} AS TEXT) LIKE ?", "%#{search}%"], :order => column
		else
			return nil
		end
	end

end

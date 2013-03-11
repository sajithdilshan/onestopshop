class Order < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	validates :product_id, :presence => true
	validates :quantity, :presence => true
	validates :cost, :presence => true

	def self.search_orders(column, search)
	  if search and column
	    find(:all, :conditions => ["CAST(#{column} AS TEXT) ILIKE ?", "%#{search}%"])
	  else
	    return nil
	  end
	end

end
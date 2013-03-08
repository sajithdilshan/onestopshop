class Product < ActiveRecord::Base
	has_many :line_items
	validates :description, :presence => true
	validates :product_type, :presence => true
	validates :remaining_quantity, :presence => true
	validates :rate, :presence => true
	# self.per_page = 20

	def self.search_products(column, search, page, p_page)
		if search and column
			paginate :per_page => p_page, :page => page, :conditions => ["#{column} LIKE ?", "%#{search}%"], :order => column
		else
			return nil
		end
	end

	before_destroy :ensure_not_referenced_by_any_line_item
	# ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		if line_items.count.zero?
			return true
		else
			errors.add(:base, 'Line Items present' )
			return false
		end
	end


end

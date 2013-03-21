class Payment < ActiveRecord::Base
	validates :customer_id, :presence => true
	validates :amount, :presence => true
  validates :amount, :numericality => { :greater_than => 0 }
	validates :paid_date, :presence => true

  def self.search_payments(column, search, page, p_page)
    if search and column
      paginate :per_page => p_page, :page => page, :conditions => ["CAST(#{column} AS TEXT) ILIKE ?", "%#{search}%"], :order => column
    else
      return nil
    end
  end

end

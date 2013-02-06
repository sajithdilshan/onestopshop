class Payment < ActiveRecord::Base
	validates :customer_id, :presence => true
	validates :amount, :presence => true
	validates :paid_date, :presence => true

  def self.search_payments(column, search)
    if search and column
      find(:all, :conditions => ["#{column} LIKE ?", "%#{search}%"])
    else
      return nil
    end
  end

end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

more_products =[
{:description => 'iphone 4S', :product_type => 'phone', :remaining_quantity => 40, :rate => 400.00},
{:description => 'iphone 5', :product_type => 'phone', :remaining_quantity => 42, :rate => 480.00},
{:description => 'HP DV6', :product_type => 'PC', :remaining_quantity => 45, :rate => 800.00},
{:description => 'Galexy SIII', :product_type => 'phone', :remaining_quantity => 20, :rate => 470.00}]

Product.send(:attr_accessible, :description, :product_type, :remaining_quantity, :rate)
more_products.each do |product|
	Product.create!(product)
end
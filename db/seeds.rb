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

more_customers = [{:first_name => 'John', :middle_name => 'Smith',
:last_name => 'Joe', :address => 'No52, 2nd street', :province => 'western',
:telephone_number => '0112508077', :email => 'john@mail.com', :customer_type => 'mailorder', :registration_number => '1111'},
{:first_name => 'Jane', :middle_name => 'Smith',
:last_name => 'Doe', :address => 'No57, 2nd street', :province => 'western',
:telephone_number => '0112708077', :email => 'jane@mail.com', :customer_type => 'largeorder', :registration_number => '2222', :initial_credit => 500.0, :remaining_credit => 500, :sales_assistant => '4521'},
{:first_name => 'Joan', :middle_name => 'Smith',
:last_name => 'Dean', :address => 'No52, 3rd street', :province => 'western',
:telephone_number => '0112777777', :email => 'joan@mail.com', :customer_type => 'walkinretail', :registration_number => '3333', :initial_credit => 700.0, :remaining_credit => 700}
]

Customer.send(:attr_accessible, :first_name, :middle_name , :last_name, :address, :province, :telephone_number, :email, :customer_type, :registration_number, :initial_credit, :remaining_credit, :sales_assistant)
more_customers.each do |customer|
	Customer.create!(customer)
end




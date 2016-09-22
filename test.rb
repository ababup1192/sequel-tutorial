require 'sequel'

DB = Sequel.sqlite('test.sqlite3')

DB.create_table :items do
  primary_key :id
  String :name
  Float :price
end

items = DB[:items]

items.insert(:name => 'abc', :price => 90)
items.insert(:name => 'def', :price => 120)
items.insert(:name => 'ghi', :price => 150)

puts "レコード数: #{items.count}"

puts "priceの平均: #{items.avg(:price)}"

items.filter('name = "abc"').update(:price => 180)

puts "priceの平均: #{items.avg(:price)}"

items.filter('name = "ghi"').delete

puts "レコード数: #{items.count}"

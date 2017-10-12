require 'rubygems'
require 'pry'
require 'json'

module Products
  def self.sort_by_price_ascending(json_string)
    price_array = []
    json_array = JSON.parse(json_string).sort_by do |hsh|
      hsh["price"]
      hsh["name"]
      # binding.pry
    end

    # new_arr = json_array.sort_by {|hsh| hsh["price"]}
    # json_array.each {|hsh| price_array << hsh["price"] }
    #
    # json_array.sort_by do |hsh|
    #   if hsh["price"]
    # end
    # new_arr.to_json
    json_array.to_json
    # price_array
  end
end

p Products.sort_by_price_ascending('[{"name":"eggs","price":1},{"name":"zoffee","price":9.99},{"name":"rice","price":4.04},{"name":"azafraz","price":9.99}]')

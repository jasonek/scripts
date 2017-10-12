require 'rubygems'
require 'pry'

class Array
  def equil_index
    (1..self.length).each do |x|
      first_portion = self[0..(x-1)]
      last_portion = self[(x+1)..-1]
      # binding.pry
      return x if first_portion.sum == last_portion.sum
    end
    return -1
  end

  def sum
    inject { |sum, x| sum + x }
  end
end




my_arr = [-1, 3, -4, 5, 1, -6, 2, 1]

p my_arr.equil_index

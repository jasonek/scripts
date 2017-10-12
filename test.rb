require 'pry'

class CategoryTree
  attr_accessor :category_hash

  def initialize
    @category_hash = Hash.new { |hash, key| hash[key] = {} }
  end

  def add_category(category, parent)
    if parent.nil?
      @category_hash[category] = {}
    elsif @category_hash.deep_find(parent).empty? # if the parent has no values then assign [parent] = category
      binding.pry
      @category_hash.deep_find(parent)[category] = {}
    # elsif !@category_hash[parent].empty? # that key already exists, append a new value to it
      # @category_hash[parent].store(category, {} )
    end
  end

  def get_children(parent)
    new_hash = {}
    @category_hash.each do |k,v|
      # binding.pry
      if k == parent
        return new_hash = v
      else
        get_children(v)
      end
    end
    new_hash
  end

  def flatten_nested_hash(hash)
    hash.flat_map{|k, v| [k, *flatten_nested_hash(v)]}
  end

end


class Hash
  def deep_find(key)
    key?(key) ? self[key] : self.values.inject(nil) {|memo, v| memo ||= v.deep_find(key) if v.respond_to?(:deep_find) }
  end
end

c = CategoryTree.new
# p c.category_hash
# c.add_category("b",'a')
c.add_category('A', nil)
c.add_category('B', 'A')
c.add_category('C', 'A')
c.add_category('F', 'B')
c.add_category('D', 'C')
c.add_category('Z','X')
# p c.category_hash
# puts (c.get_children('A') || []).join(',')

p c.get_children('A')

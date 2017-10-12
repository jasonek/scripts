require 'pry'


# # you can write to stdout for debugging purposes, e.g.
# # puts "this is a debug message"
#
def solution(a)
  return false unless a.is_a? Array
  return false if a.empty?
  return false unless a[0].is_a? Integer
  i=0
  recursive_look(a,0,i)
end

def recursive_look(arry, integr, counter)
  counter +=1
  return counter if arry[integr] == 0
  if arry[integr] == -1
    return counter
  else
    recursive_look(arry, arry[integr], counter)
  end
end

# test1 = [1,4,-1,3,2]
# p solution(test1)

# def my_sol(a)
#   h = make_hash(a)
#   calc_diff_of_indices(h)
# end
#
# def make_hash(arr)
#   hsh = Hash.new { |h, k| h[k] = [] }
#   arr.each_with_index do |element, index|
#     hsh[element] << index
#   end
#   hsh
# end
#
# def calc_diff_of_indices(hash)
#   largest_difference_so_far = 0
#   hash.each do |k,v|
#     min_and_max = v.minmax
#     difference = min_and_max[1]-min_and_max[0]
#     if difference > largest_difference_so_far
#       largest_difference_so_far = difference
#     end
#   end
#   largest_difference_so_far
# end
#
# test1 = [4, 6, 2, 2, 6, 6, 1]
#
# p my_sol(test1)

def solution(n)
    d = Array.new # WHY LIMIT TO 30?
    l = 0
    while (n > 0) # MAKING BINARY REPRESENTATION OF NUMBER AND PUTTING INTO ARRAY d
        d[l] = n % 2
        n /= 2
        l += 1
        # binding.pry
    end
    for r in 1 .. l # Checking for period
        ok = true
        for i in 0 .. l - r - 1
            if (d[i] != d[i  +  r]) then
                ok = false
                # break
            end
        end
        if (ok) then
            return r
        end
    end
    return -1
end

p solution(955)

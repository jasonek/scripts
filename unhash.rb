require 'pry'

def hash(s) 
    s = s.to_s
    h = 7
    letters = "acdegilmnoprstuw"
     s.each_char do |letter|
         h = (h * 37 + letters.index(letter))
     end
     h
end

# puts hash("leepadg")

def unhash(hashdigest)
    limit = "acdegilmnoprstuw".length
    answer_array = []
    new_hashdigest = hashdigest
    
    until new_hashdigest == 7
        catch :found_clean_digest do
            (0..limit).each do |integr|
                h = new_hashdigest - integr
                if h % 37 == 0
                    answer_array.insert(0,integr)
                    new_hashdigest = new_hashdigest/37
                    throw :found_clean_digest
                end
            end
        end
    end
    answer_array
end

# puts unhash(680131659347)

def convertToLetters(myarray,letters_key)
    answer_string = ''
    myarray.each do |x|
        answer_string += letters_key[x]
    end
    answer_string
end

puts convertToLetters(unhash(945924806726376), "acdegilmnoprstuw")
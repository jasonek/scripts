# SELECT userId, AVG(duration) FROM sessions
# JOIN (SELECT COUNT(userId) FROM SESSIONS
# ) counted ON counted.userId = sessions.userId
# GROUP BY userId


# SELECT AVG(rating) FROM sellers
# JOIN (
#     SELECT sellerId, COUNT(sellerId) as cnt FROM items
#   ) results on results.sellerId = sellers.id
#   WHERE cnt > 1


require 'pry'

class Path
  def initialize(path)
    @current_path = path
  end

  def current_path
    @current_path
  end

  def cd(new_path)
    @current_path === "/" ? root = true : root = false

    if root # if you are already in root, any path should be valid
        @current_path = new_path
    elsif new_path.include?(@current_path) && (@current_path[0,1] == new_path[0,1])  # if the beginning of the @current_path matches the beginning of the new path, then go to new path
        @current_path = new_path
      elsif new_path.include?("..")
    end

    # end
    self
  end

  def up_directory(new_path) # helper method to go up .. directory
    # for each .. in beginning of new_path, remove one X/ from end of @current_path
    directories_to_ascend = new_path.scan("..").count

  end
end

path = Path.new('/a/b/c/d')
# path = path.cd('../x')

path = Path.new('/')
puts path && path.current_path

path = path.cd('/a/b/c/d')
p path.class
puts path.class && path.current_path.class

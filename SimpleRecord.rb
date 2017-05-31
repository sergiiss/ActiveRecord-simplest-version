class SimpleRecord
  def self.has_many(symbol)
    define_method(symbol) { puts "SELECT * FROM #{symbol}" }
  end
end

class Post < SimpleRecord
  has_many :comments
end

p = Post.new
p.comments








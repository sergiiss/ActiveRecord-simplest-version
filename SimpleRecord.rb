class SimpleRecord
  def self.has_many(symbol)
    define_method(symbol) do
      SimpleScope.new(symbol)
    end
  end
end

class SimpleScope
  attr_reader :symbol, :foo

  def initialize(symbol)
    @symbol = symbol
  end

  def to_s
    puts "SELECT * \nFROM #{symbol} \n#{foo}"
  end

  def order(column_name)
    @foo =
      case column_name
      when "created_at DESC"
        "ORDER BY #{column_name}"
      when "created_at ASC" || "created_at"
        "ORDER BY #{column_name}"
      end
    self
  end
end

class Post < SimpleRecord
  has_many :comments
end

p = Post.new
p.comments.order("created_at ASC").to_s

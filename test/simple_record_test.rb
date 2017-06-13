require 'test_helper'

class TestSimpleRecord < Minitest::Test
  attr_reader :post

  def setup
    @post = Post.new
  end

  def test_method_order_ASC
    result_sql = post.comments.order("created_at ASC").to_s

    assert_equal "SELECT *\nFROM comments\nORDER BY created_at ASC", result_sql
  end

  def test_method_order_desc
    result_sql = post.comments.order("created_at desc").to_s

    assert_equal "SELECT *\nFROM comments\nORDER BY created_at desc", result_sql
  end

  def test_method_order
    result_sql = post.comments.order("created_at").to_s

    assert_equal "SELECT *\nFROM comments\nORDER BY created_at ASC", result_sql
  end

  def test_method_through_symbol
    result_sql = post.comments.to_s

    assert_equal "SELECT *\nFROM comments", result_sql
  end

  def test_method_where
    result_sql = post.comments.where("name = 'Mike'").to_s

    assert_equal "SELECT *\nFROM comments\nWHERE name = 'Mike'", result_sql
  end

  def test_method_where_with_order
    result_sql = post.comments.where("name = 'Mike'").order("created_at").to_s

    assert_equal "SELECT *\nFROM comments\nWHERE name = 'Mike'\nORDER BY created_at ASC", result_sql
  end

  def test_method_where_with_hash
    result_sql = post.comments.where({ name: 'Mike', color: 'black', age: 17 }).to_s

    assert_equal "SELECT *\nFROM comments\nWHERE name = 'Mike' AND color = 'black' AND age = 17", result_sql
  end

  def test_method_where_with_hash_value_array
    result_sql = post.comments.where({ name: ["Mike", "Klause"] }).to_s

    assert_equal "SELECT *\nFROM comments\nWHERE name IN ('Mike', 'Klause')", result_sql
  end

  def test_method_where_with_three_arguments_hash_value_array
    result_sql = post.comments.where({ name: ["Mike", "Klause"], age: [14, 55], city: ["Minsk", "Moscow", "NY"] }).to_s

    assert_equal "SELECT *\nFROM comments\nWHERE name IN ('Mike', 'Klause') AND age IN (14, 55) AND city IN ('Minsk', 'Moscow', 'NY')", result_sql
  end

  def test_method_where_chain_1
    result_sql = post.comments.where.not(name: "Luise").to_s

    assert_equal "SELECT *\nFROM comments\nWHERE name != 'Luise'", result_sql
  end

  def test_method_where_chain_2
    result_sql = post.comments.where.not(name: nil).to_s

    assert_equal "SELECT *\nFROM comments\nWHERE name IS NOT NULL", result_sql
  end

  def test_method_where_chain_3
    result_sql = post.comments.where.not(name: "Jon", role: "admin").to_s

    assert_equal "SELECT *\nFROM comments\nWHERE name != 'Jon' AND role != 'admin'", result_sql
  end
end

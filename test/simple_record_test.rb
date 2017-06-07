require 'test_helper'

class TestSimpleRecord < Minitest::Test
  def test_method_order_ASC
    post = Post.new

    result_sql = post.comments.order("created_at ASC").to_s

    assert_equal "SELECT *\nFROM comments\nORDER BY created_at ASC", result_sql
  end

  def test_method_order_desc
    post = Post.new

    result_sql = post.comments.order("created_at desc").to_s

    assert_equal "SELECT *\nFROM comments\nORDER BY created_at desc", result_sql
  end

  def test_method_order
    post = Post.new

    result_sql = post.comments.order("created_at").to_s

    assert_equal "SELECT *\nFROM comments\nORDER BY created_at ASC", result_sql
  end

  def test_method_through_symbol
    post = Post.new

    result_sql = post.comments.to_s

    assert_equal "SELECT *\nFROM comments", result_sql
  end

  def test_method_where
    post = Post.new

    result_sql = post.comments.where("name = 'Mike'").to_s

    assert_equal "SELECT *\nFROM comments\nWHERE name = 'Mike'", result_sql
  end

  def test_method_where_with_order
    post = Post.new

    result_sql = post.comments.where("name = 'Mike'").order("created_at").to_s

    assert_equal "SELECT *\nFROM comments\nWHERE name = 'Mike'\nORDER BY created_at ASC", result_sql
  end

  def test_method_where_with_hash
    post = Post.new

    result_sql = post.comments.where({ name: 'Mike', color: 'black', age: 17 }).to_s

    assert_equal "SELECT *\nFROM comments\nWHERE name = 'Mike' AND color = 'black' AND age = 17", result_sql
  end
end

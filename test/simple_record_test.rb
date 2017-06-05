require 'test_helper'

class TestSimpleRecord < Minitest::Test
  def test_order
    p = Post.new
    result = p.comments.order("created_at ASC").to_s

    assert_equal "SELECT * \nFROM comments \nORDER BY created_at ASC", result
  end

  def test_method_through_symbol
    p = Post.new
    result = p.comments.to_s

    assert_equal "SELECT * \nFROM comments \n", result
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simple_record'
require 'minitest/autorun'

class Post < SimpleRecord::Base
  has_many :comments
end




# module SimpleRecord
#   class WhereChain
#     attr_reader :foo

#     def initialize(symbol)

#     def where
#     end

#     def not(arguments)
#       if arguments.class == Hash
#         arguments.each do |key, value|
#          @wes = value @res = key if value.class == String
#         end
#       end
#       @foo = "Where #{@res} != #{@wes}"
#     end

#     def to_s
#       "SELECT *\nFROM #{foo}"
#     end
#   end
# end

# TODO
# without_index((1..1000).to_a.shuffle) == (1..1000).to_a.shuffle.sort
# -*- encoding : utf-8 -*-
require 'minitest/autorun'
require_relative '../methods/sort_methods'

class TestSortArray < Minitest::Test
  using Algorithm::ArraySort

  method_names = %w[insertion_sort!]

  method_names.each do |method_name|
    define_method "test_#{method_name}" do 
      p dizzy_array.methods
      assert dizzy_array.insertion_sort! == dizzy_array.sort!
      
      # compared_arraies.each do |compared_array|
      #   assert send(method_name,compared_array[:a1], compared_array[:a2]) == compared_array[:should]
      # end
    end
  end

  def dizzy_array
    (-100...100).to_a.shuffle
  end

end
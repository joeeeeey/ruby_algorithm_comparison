# -*- encoding : utf-8 -*-
require 'minitest/autorun'
require_relative '../methods/sort_methods'

class TestSortArray < Minitest::Test
  include Algorithm::ArraySort
  method_names = %w[insertion_sort! selection_sort! merge_sort!]

  method_names.each do |method_name|
    define_method "test_#{method_name}" do 
      assert dizzy_array.send(method_name) == dizzy_array.sort!
    end
  end

  def dizzy_array
    (-100...100).to_a.shuffle
  end
end
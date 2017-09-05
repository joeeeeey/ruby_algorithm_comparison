# -*- encoding : utf-8 -*-
require 'minitest/autorun'
require_relative '../methods/compare_array_methods'

class TestTwoArrayIsEqual < Minitest::Test
  include Algorithm::ArrayComparsion

  method_names = %w[hash_compare subtract md5_compare sort_compare]

  compared_arraies = [{a1: [], a2: ['2'], should: false},
                      {a1: ['1'], a2: ['2'], should: false},
                      {a1: ['1','2'], a2: ['2','1'], should: true},
                      {a1: ['1','1'], a2: ['2','1'], should: false},
                      {a1: ['1','2','2'], a2: ['2','1','2'], should: true} ]

  method_names.each do |method_name|
    define_method "test_#{method_name}" do 
      compared_arraies.each do |compared_array|
        assert send(method_name,compared_array[:a1], compared_array[:a2]) == compared_array[:should]
      end
    end
  end

  def mocked_obj
    self
  end
end
 







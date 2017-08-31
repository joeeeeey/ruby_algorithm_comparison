require_relative 'methods/compare_array_methods'

class TwoArrayIsEqual
  include Algorithm::ArrayComparsion

  require 'benchmark'

  def self.compute
    puts "请输入要计算的数组个数，回车默认 5_000_000 个: " 
    STDOUT.flush 

    bits = STDIN.gets.chomp 
    array_size = bits.to_i <= 0 ? 5_000_000 : bits.to_i
    obj = TwoArrayIsEqual.new
    Benchmark.bm do |x|
      origin_arr = (0..array_size-1).to_a.shuffle.map {|e|e.to_s}

      random_arr = (0..array_size-1).to_a.shuffle.map {|e|e.to_s}

      x.report("sort:") do
        obj.sort_compare(origin_arr, random_arr)
      end

      x.report("hash:") do
        obj.hash_compare(origin_arr, random_arr)
      end

      x.report("md5:") do
        obj.md5_compare(origin_arr, random_arr)
      end
     
      x.report("subtract:") do
        obj.subtract(origin_arr, random_arr)
      end
    end
  end
end

TwoArrayIsEqual.compute





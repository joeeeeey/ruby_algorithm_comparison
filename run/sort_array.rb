require 'benchmark'
require_relative '../methods/sort_methods'
  # def quick_sort
  #   return [] if self.empty?
  #   x, *a = self
  #   left, right = a.partition{|t| t < x}
  #   left.quick_sort + [x] + right.quick_sort
  # end
class SortArray
  include Algorithm::ArraySort

  def compute
    puts "请输入要计算的数组个数，回车默认 10_000 个: " 
    STDOUT.flush 
    
    bits = STDIN.gets.chomp 
    array_size = bits.to_i <= 0 ? 10_000 : bits.to_i
    array = (0..array_size-1).to_a
    Benchmark.bm do |x|
      # a = array.dup
      array = (0..array_size-1).to_a.shuffle

      x.report("merge_sort:") do
        array.merge_sort!
      end
    end

    Benchmark.bm do |x|
      array = (0..array_size-1).to_a.shuffle
      # a = array.dup
      x.report("quick_sort:") do
        array.quick_sort!
      end
    end

    # Benchmark.bm do |x|
    #   array = (0..array_size-1).to_a.shuffle
    #   # a = array.dup
    #   x.report("ruby_sort:") do
    #     array.sort!
    #   end
    # end

    Benchmark.bm do |x|
      array = (0..array_size-1).to_a.shuffle.map {|e|e.to_s}

      x.report("insertion_sort:") do
        array.insertion_sort!
      end
    end

    Benchmark.bm do |x|
      array = (0..array_size-1).to_a.shuffle
      # a = array.dup
      x.report("selection_sort:") do
        array.selection_sort!
      end
    end

    Benchmark.bm do |x|
      array = (0..array_size-1).to_a.shuffle
      # a = array.dup
      x.report("bubble_sort:") do
        array.bubble_sort!
      end
    end
  end
end

SortArray.new.compute
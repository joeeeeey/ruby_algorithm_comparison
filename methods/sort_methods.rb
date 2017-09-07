module Algorithm
  module ArraySort

    Array.class_eval do
      # 选择排序
      # 一次找出 A 中最小元素并与 A[i] 交换位置
      def selection_sort!(order='ASC')
        operator = case order.to_s.upcase
                   when 'ASC' then :>
                   when 'DESC' then :<
                   else 
                    :>
                   end
        (0...self.size).to_a.each do |i|
           k = i
           key = self[i]

          (i+1...self.size).to_a.each do |j|
            if self[i].send(operator, self[j])

              self[i] = self[j]
              k = j
            end
          end

          self[k] = key
        end
        self
      end

      # 插入排序 
      # 时间复杂度: 4.3e-08 * (n**2)  (n 为数组大小)
      
      def insertion_sort!(order='ASC')
        operator = case order.to_s.upcase
                   when 'ASC' then :<
                   when 'DESC' then :> 
                   else 
                    :< 
                   end

        (0...self.size).to_a.each do |i|
          key = self[i]
          j = i - 1 # (0..i-1)
          while j >=0 && key.send(operator,self[j]) 
            self[j+1] = self[j] 
            j-=1
          end

          self[j+1] = key
        end
        self
      end

      # from ruby-china https://ruby-china.org/topics/20569
      def merge_sort!
        return self if self.size <= 1
        left = self[0, self.size/2]
        right = self[self.size/2, self.size - self.size/2]
        Array.merge(left.merge_sort, right.merge_sort)
      end

      def self.merge(left, right)
        sorted = []
        until left.empty? or right.empty?
          sorted << (left.first <= right.first ? left.shift : right.shift)
        end
        sorted + left + right
      end

      # 定义无叹号方法
      %w(selection merge insertion).each do |metd|
        define_method("#{metd}_sort") do
          # dup 即为 self 的 clone 对象
          self.dup.send("#{metd.to_s}_sort!") 
        end
      end

      # 根据<算法导论>例子得出, 比 ruby-china 的例子要慢
      # 原因在于 merge 方法中当一个数组空了仍然都遍历比较了一遍
      # def merge_sort!(p=0, r=self.size-1)
      #   if p < r 
      #     q = (p+r)/2
      #     merge_sort!(p ,q)
      #     merge_sort!(q+1 ,r)
      #     merge(p, q, r)
      #   end

      #   return self
      # end

      # # private
      # def merge(p, q, r)
      #   # 根据 index 产生需合并的两个数组
      #   left = self[p..q]
      #   right = self[(q+1)..r]

      #   # 分别在两个元素尾部增加 无穷大
      #   left << Float::INFINITY
      #   right <<  Float::INFINITY
    
      #   i = 0
      #   j = 0
      #   (p..r).to_a.each do |k|
      #     if left[i] < right[j]
      #       self[k] = left[i]
      #       i += 1
      #     else 
      #       self[k] = right[j]
      #       j += 1  
      #     end
      #   end
      # end


    end

  end
end



module Algorithm
  module ArraySort
    # 插入排序 
    # 时间复杂度 n 为 数组大小
    # 0.0000278 * n * Math.log2(n)
    def insertion_sort(a, order='ASC')
      operator = case order.to_s.upcase
                 when 'ASC' then :<
                 when 'DESC' then :> 
                 else 
                  :< 
                 end

      (0...a.size).to_a.each do |i|
        key = a[i]
        j = i - 1 # (0..j-1)
        while j >=0 && key.send(operator,a[j])
          a[j+1] = a[j] 
          j-=1
        end

        a[j+1] = key
      end
      a
    end

    refine Array do 
      def insertion_sort!(order='ASC')
      operator = case order.to_s.upcase
                 when 'ASC' then :<
                 when 'DESC' then :> 
                 else 
                  :< 
                 end

        (0...self.size).to_a.each do |i|
          key = self[i]
          j = i - 1 # (0..j-1)
          while j >=0 && key.send(operator,self[j]) 
            self[j+1] = self[j] 
            j-=1
          end

          self[j+1] = key
        end
        self
      end
    end

  end
end



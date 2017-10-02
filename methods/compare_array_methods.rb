module Algorithm
  module ArrayComparsion
    require 'digest'
    def MD5(str)
      Digest::MD5.hexdigest str
    end

    # 将其中一个数组转化为 格式为 { 数组元素 => 数组元素个数 }  的hash
    # 遍历另一个数组比较
    # 占用额外的 O(N) 空间
    def hash_compare(a1, a2)
     return false unless a1.size == a2.size
     hash = {}
     a1.each do |e|
       if hash[e]
         hash[e] = (hash[e]+ 1)
       else 
         hash[e] = 1
       end
     end
     
     count = 0

     a2.each do |e|
      value = hash[e].to_i
      if value == 1
        count += 1
        hash[e] = 0
      elsif value > 1
        hash[e] -= 1   
      end
     end

     hash.size == count
    end

    # 对比数组元素的摘要值之和，这边使用 md5 加密 (32*4位二进制数)
    # 仅仅对元素都是字符串的数组有效
    # 不占用额外空间
    # 很慢(md5耗时)
    def md5_compare(a1, a2)
      a1_md5_count = 0
      a2_md5_count = 0

      a1.each {|e| a1_md5_count += (MD5(e).to_i(16))}
      a2.each {|e| a2_md5_count += (MD5(e).to_i(16))}

      a1_md5_count == a2_md5_count
    end

    # 将两个数组排序
    # 一次比对
    # 排序使用 ruby array 自带 sort (算法复杂度未知)
    # 不占用额外空间
    # 相对较快
    def sort_compare(a1, a2)
      return false unless a1.size == a2.size
      a1.sort == a2.sort
      
      # return false unless a1.size == a2.size
      # a1.sort!
      # a2.sort!
      # a1.each_with_index do |e, index|
      #   next if e == a2[index]
      #   return false 
      # end
      # return true 
    end

    def sort_compare2(a1, a2)
      a1.sort == a2.sort
    end
  end 
end
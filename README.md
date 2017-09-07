# 比较 ruby 实现的不同算法


## 一. 比较两个数组完全相等

### 运行

```bash
$ ruby compare_two_arrays.rb 
 => 请输入要计算的数组个数，回车默认 5_000_000 个: 
```

### 输出

5_000_000 个元素

  method   |  user  |system | total         |real     | extra-memery
:---------:|:------:|:-----:|:----------|:-------------|:-------------|
sort:  |14.490000  | 0.160000 | 14.650000 |(14.983050) | - |
hash: | 12.710000 |  0.380000 | 13.090000 | (13.341076) | O(N) | 
md5:  |19.470000 |  0.490000 | 19.960000 | (21.023923) | - |
subtract: | 19.880000  | 0.350000 | 20.230000 | (21.334710) | O(N) |



### 结论

选取时间空间复杂度最低的算法: sort

```ruby
  def sort_compare(a1, a2)
    return false unless a1.size == a2.size
    a1.sort!
    a2.sort!
    a1.each_with_index do |e, index|
      next if e == a2[index]
      return false 
    end
    return true 
  end
```

## TODO 其他算法
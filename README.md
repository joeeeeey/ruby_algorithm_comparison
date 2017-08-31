# 比较 ruby 实现的不同算法


## 一. 比较两个数组完全相等

### 运行

```bash
$ ruby compare_two_arrays.rb 
 => 请输入要计算的数组个数，回车默认 10_000_000 个:
$ 2000000 
```

### 输出

5_000_000 个元素

  method   |  user  |system | total         |real     | extra-memery
:---------:|:------:|:-----:|:----------|:-------------|:-------------|
sort:  |14.490000  | 0.160000 | 14.650000 |(14.983050) | - |
hash: | 21.650000 |  0.420000 | 22.070000 | (22.309347) | O(2N) | 
md5:  |59.310000 |  1.740000 | 61.050000 | (61.452516) | - |
subtract: | 53.270000  | 0.520000 | 53.790000 | (54.151217) | O(2N) |

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
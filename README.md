# 比较 ruby 实现的不同算法

## 一. 比较两个数组完全相等

### Run

```bash
$ ruby run/compare_two_arrays.rb 
 => 请输入要计算的数组个数，回车默认 5_000_000 个: 
```

### some benchmarking

5_000_000 个元素
ruby version: 2.1.4

  method   |  user  |system | total         |real     | extra-memery
:---------:|:------:|:-----:|:----------|:-------------|:-------------|
sort:| 16.050000  | 0.100000 | 16.150000 |( 16.234005)|
hash: |11.040000 |  0.370000 | 11.410000| ( 11.870481) |
md5: |24.970000 |  0.700000 | 25.670000 |( 26.235543)|

ruby version: 2.4.1(fast hash)

  method   |  user  |system | total         |real     | extra-memery
:---------:|:------:|:-----:|:----------|:-------------|:-------------|
sort:  |14.490000  | 0.160000 | 14.650000 |(14.983050) | - |
hash: | 7.980000 |  0.380000 |  8.290000 | (8.324756) | O(N) | 
md5:  |19.470000 |  0.490000 | 19.960000 | (21.023923) | - |

## 二. 数组排序

### Run

```bash
$ ruby run/sort_array.rb 
 => 请输入要计算的数组个数，回车默认 10_000 个: 
```
### some benchmarking

#### ENV:
1. Ruby Version: 2.1.4 
2. 10_000个不同的乱序元素:


  method   |  user  |system | total  |real     
:---------:|:------:|:-----:|:----------|:-------------
merge_sort:|  0.040000  | 0.000000 | 0.040000 |(  0.049320)
quick_sort: | 0.030000 |  0.000000 |  0.030000 |(  0.035742)
insertion_sort:| 5.870000  | 0.050000  | 5.920000 |(  6.028975)
selection_sort: | 9.340000  | 0.090000  | 9.430000 |(  9.461386)
bubble_sort:| 12.720000  | 0.110000 | 12.830000 |( 13.049285)


#### ENV:
1. Ruby Version: 2.4.1 
2. 10_000个不同的乱序元素:

  method   |  user  |system | total   |real     
:---------:|:------:|:-----:|:----------|:-------------
merge_sort: | 0.030000 |  0.000000  | 0.030000 |(  0.032159)
quick_sort: | 0.030000|   0.000000  | 0.030000| (  0.028015)
insertion_sort: | 4.480000 |  0.010000  | 4.490000 |(  4.501755)
selection_sort: | 7.580000  | 0.120000 |  7.700000 |(  7.743162)
bubble_sort: | 7.970000  | 0.030000 |  8.000000|(  8.038777)

#### ENV:
1. Ruby Version: 2.4.1 
2. 100_000个不同的乱序元素:

  method   |  user  |system | total   |real     
:---------:|:------:|:-----:|:----------|:-------------
merge_sort: | 0.350000  | 0.010000 |  0.360000 |(  0.367695)
quick_sort: | 0.270000 |  0.000000  | 0.270000 |(  0.282230)
insertion_sort: | too slow
selection_sort: | too slow
bubble_sort: | too slow

1. Ruby Version: 2.4.1 
2. 1_000_000个不同的乱序元素:

  method   |  user  |system | total   |real     
:---------:|:------:|:-----:|:----------|:-------------
merge_sort: | 3.930000  | 0.060000  | 3.990000 | (  4.013832)
quick_sort: | 3.570000  | 0.020000  | 3.590000 |(  3.632866)

## 三. [生日问题](http://www.joeysblog.online/tou/posts/13)(某个星球一个屋里人数必须达到多少，才能使其中两人生日的机会达到某个概率)

### Run

```bash
$ ruby run/birthday_problem.rb
 => 请输入要计算的天数,直接回车默认在地球 365 天 : 

 => 请输入要大于的概率,直接回车默认 0.5:
```

#### ENV:
1. Ruby Version: 2.4.1 
2. 概率: 0.5
3. 天数: 10**15

```ruby
# 由不等式推导的公式计算
def formula(prob_greater_than, days)
  (1 + (days * (8 * Math.log(1/(1-prob_greater_than), Math::E)))**0.5) / 2
end

# 迭代计算
def interation(prob_greater_than, days)
  prob = 0.0
  numPeople = 1
  until prob > prob_greater_than do 
    prob = 1 - ( (1-prob) * (days - (numPeople - 1))/days )
    numPeople += 1
  end

  return numPeople-1
end
```

  method   |  user  |system | total   |real     
:---------:|:------:|:-----:|:----------|:-------------
公式: | 0.000000  | 0.000000  | 0.000000| (  0.000242)
迭代: | 4.740000  | 0.020000  | 4.760000 |(  4.815006)

使用公式:"在【1.0e+15】天中使两人生日相同概率达到【0.5】需要【37232974.6106】人"

使用迭代:"在【1.0e+15】天中使两人生日相同概率达到【0.5】需要【37232975.0】人"

## 四 计算阶乘

```ruby
# 递归，n < 10060, 否则堆栈过深
def recursively(n)
  if n==1
    return 1
  else
    n * fact(n-1)
  end
end

# 不会有堆栈过深问题
def by_inject(n)
  (1..n).inject(:*)
end
```
## TODO LIST
* 增加其他算法

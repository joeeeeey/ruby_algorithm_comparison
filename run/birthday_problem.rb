require 'benchmark'

require_relative '../methods/birthday_problem_methods'

class BirthdayProblem
  include Algorithm::BirthdayProblem
  def compute
    puts "请输入要计算的天数,直接回车默认在地球 365 天 " 
    days = gets.chomp 
    days = days.to_f != 0 ? days.to_f : 365.0

    puts "请输入要大于的概率,直接回车默认 0.5" 
    prob_greater_than = gets.chomp 
    prob_greater_than = prob_greater_than.to_f == 0 ? 0.5 : prob_greater_than.to_f


    Benchmark.bm do |x|

      x.report("使用公式计算:") do
        numPeople = formula(prob_greater_than, days)
        p "在【#{days}】天中使两人生日相同概率达到【#{prob_greater_than}】需要【#{numPeople.round(4)}】人" 
      end

      x.report("使用迭代计算:") do
        numPeople = interation(prob_greater_than, days)
        p "在【#{days}】天中使两人生日相同概率达到【#{prob_greater_than}】需要【#{numPeople.round(4)}】人" 
      end

    end
  end
end

BirthdayProblem.new.compute

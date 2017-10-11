module Algorithm
  module BirthdayProblem
    # 传入 prob_greater_than (要大于的概率) 和 days (天数)
    # 得到需要多少人达到这一目的
    def interation(prob_greater_than, days)
      prob = 0.0
      numPeople = 1
      until prob > prob_greater_than do 
        prob = 1 - ( (1-prob) * (days - (numPeople - 1))/days )
        numPeople += 1
      end

      return numPeople-1
      # p "Prob. of same birthday: #{numPeople-1}" 
    end

    def formula(prob_greater_than, days)
      (1 + (days * (8 * Math.log(1/(1-prob_greater_than), Math::E)))**0.5) / 2
    end
  end
end
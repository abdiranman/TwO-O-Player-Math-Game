# question.rb

class Question
    attr_reader :num1, :num2
  
    def initialize
      @num1 = rand(1..20)
      @num2 = rand(1..20)
    end
  
    def check_answer(answer)
      answer == @num1 + @num2
    end
  
    def to_s
      "What is #{@num1} + #{@num2}?"
    end
  end
  
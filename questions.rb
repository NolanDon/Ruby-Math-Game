# generates random math question
class Question

  attr_accessor :question, :answer

  def initialize
    # syms = [:+, :-, :*, :/]
    @gen_rand_num = rand(1..20)

    @answer = @gen_rand_num + @gen_rand_num
    
    @question = "What is #{@gen_rand_num} + #{@gen_rand_num}?"

  end
end
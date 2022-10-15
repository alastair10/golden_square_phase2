class GrammarStats
  def initialize
    @tested = 0
    @correct = 0
  end

  def check(text)
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    return false if text == ""

    if (text[0] == text[0].capitalize && %w[. ? !].include?(text[-1])) == true
      # %w[. ! ?]
      # text[-1].match(/[!.?]/)
      @tested += 1
      @correct += 1
      # puts @tested
      # puts @correct
      return true
    else
      @tested += 1
      # puts @tested
      # puts @correct
      return false
    end
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%. 
    # puts "in percentage_good correct is #{@correct}"
    # puts "in percentage_good tested is #{@tested}"
    return "#{(@correct.to_f/@tested.to_f * 100).to_i}%" 
  end
end

# grammar = GrammarStats.new
# puts grammar.check("Correct!")
# puts grammar.percentage_good
# puts grammar.check("incorrect")
# puts grammar.percentage_good
# puts grammar.check("x")
# puts grammar.percentage_good
# puts grammar.check("xz!")
# puts grammar.percentage_good

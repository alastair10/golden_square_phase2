require 'grammar_stats_challenge'

describe GrammarStats do
  context "given a string" do
    it "checks if it begins with a capital and doesn't end with punctuation" do
      grammar = GrammarStats.new
      result = grammar.check("incorrect")
      expect(result).to eq false
    end
  end

  context "given a string" do
    it "checks if it begins with a capital and ends with punctuation" do
      grammar = GrammarStats.new
      result = grammar.check("Correct!")
      expect(result).to eq true
    end
  end

  context "given 1 correct string" do
    it "returns 100%" do
      grammar = GrammarStats.new
      grammar.check("Correct!")
      result = grammar.percentage_good
      expect(result).to eq "100%"
    end
  end

  context "given 1 incorrect string" do
    it "returns 0%" do
      grammar = GrammarStats.new
      grammar.check("incorrect!")
      result = grammar.percentage_good
      expect(result).to eq "0%"
    end
  end

  context "given 1 correct and 3 incorrect string" do
    it "returns 25%" do
      grammar = GrammarStats.new
      grammar.check("Correct!")
      expect(grammar.percentage_good).to eq "100%"
      grammar.check("incorrect")
      expect(grammar.percentage_good).to eq "50%"
      grammar.check("x")
      expect(grammar.percentage_good).to eq "33%"
      grammar.check("xz!")
      expect(grammar.percentage_good).to eq "25%"
    end
  end
end

 

#describe GrammarStats do
#  before :each do
#    @grammar = GrammarStats.new
#  end
#
#
# ruby - rubocop install VSCode add in
# type gem install rubocop
#
#
#%w[. ! ?]

require 'count_words'

RSpec.describe "method takes string and returns the number of words in that string" do
  context "given 3 words in str" do
    it "returns the number 3" do
      result = counter("one two three")
      expect(result).to eq 3
    end
  end

  context "given empty str" do
    it "returns 0" do
      result = counter("")
      expect(result).to eq 0
    end
  end

end
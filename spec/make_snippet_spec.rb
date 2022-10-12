require 'make_snippet'

RSpec.describe "check snippet method" do
  context "when given a long string" do
    it "returns only the first 5 words with a ..." do
      result = snippet("hello world goodbye world coding ruby extra")
      expect(result).to eq "hello world goodbye world coding..."
    end
  end

  context "given an empty string" do
    it "returns the empty string" do
      result = snippet("")
      expect(result).to eq ""
    end
  end

  context "given a 5 word string" do
    it "returns the 5 word string" do
      result = snippet("hello world goodbye world coding")
      expect(result).to eq "hello world goodbye world coding"
    end
  end  
end
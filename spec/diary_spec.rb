require 'diary'

describe Diary do
  context "if there are no entries" do
    it "returns an empty list" do
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end

  context "given a diary entry and reading speed in wpm" do
    it "returns the time it takes to read the entire diary" do
      diary = Diary.new
      diary.add("Dear Diary")
      diary.add("Hello how are you")
      expect(diary.reading_time(2)).to eq 3
    end
  end




end
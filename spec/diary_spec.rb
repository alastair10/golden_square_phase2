require 'diary'

describe Diary do
  context "if there are no entries" do
    it "returns an empty list" do
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end

  context "given no entry" do
    it "returns word counut of 0" do
      diary = Diary.new
      expect(diary.count_words).to eq 0
    end
  end

  context "given no entry" do
    it "returns nil" do
      diary = Diary.new
      expect(diary.find_best_entry_for_reading_time(2,4)).to eq nil
    end
  end


end
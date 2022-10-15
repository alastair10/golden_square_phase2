require 'diary'

describe Diary do
  context "if there are no entries" do
    it "returns an empty list" do
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end
end
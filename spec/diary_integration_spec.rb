require 'diary'
require 'diary_entry'

describe "integration" do
  context "when we add an entry to the diary" do
    it "adds the entry to a list" do
      diary = Diary.new # new instance of class
      entry = DiaryEntry.new("Today", "I ate crips.") # new instance of class
      diary.add(entry) # adding entry from DiaryEntry class to a list in Diary class
      expect(diary.all).to eq [entry] # list should be the diary entry 
    end
  end

  context "when we add multiple entries to the diary" do
    it "adds all entries to a list" do
      diary = Diary.new # new instance of class
      entry_1 = DiaryEntry.new("Yesterday", "I ate crips.") # new instance of class
      entry_2 = DiaryEntry.new("Today", "I ate ice cream.") # a second instance
      diary.add(entry_1) # adding 1st entry
      diary.add(entry_2) # adding 2nd entry
      expect(diary.all).to eq [entry_1, entry_2] # list should be the diary entry 
    end
  end
end
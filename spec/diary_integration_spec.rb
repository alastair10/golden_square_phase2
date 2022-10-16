require 'diary'
require 'diary_entry'

describe "Diary integration" do
  context "when we add an entry to the diary" do
    it "adds the entry to a list" do
      diary = Diary.new # new instance of class
      entry = DiaryEntry.new("Today", "I ate crisps.") # new instance of class
      diary.add(entry) # adding entry from DiaryEntry class to a list in Diary class
      expect(diary.all).to eq [entry] # list should be the diary entry 
    end
  end

  context "when we add multiple entries to the diary" do
    it "adds all entries to a list" do
      diary = Diary.new # new instance of class
      entry_1 = DiaryEntry.new("Yesterday", "I ate crisps.") # new instance of class
      entry_2 = DiaryEntry.new("Today", "I ate chocolate ice cream.") # a second instance
      entry_3 = DiaryEntry.new("Friday", "I went to Makers to learn how to run rspec tests.")
      diary.add(entry_1) # adding 1st entry
      diary.add(entry_2) # adding 2nd entry
      diary.add(entry_3) # adds 3rd entry
      expect(diary.all).to eq [entry_1, entry_2, entry_3] # list should be the diary entry 
    end
  end

  context "given multiple diary entries" do
    it "counts the words in the entries excluding the title" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Yesterday", "I ate crisps.") # new instance of class
      entry_2 = DiaryEntry.new("Today", "I ate chocolate ice cream.") # a second instance
      diary.add(entry_1) # adding 1st entry
      diary.add(entry_2) # adding 2nd entry
      expect(diary.count_words).to eq 8 
    end
  end

  context "when given 0 wpm" do
    it "raises error message" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Yesterday", "one two three") # new instance of class
      entry_2 = DiaryEntry.new("Today", "one two three") # a second instance
      diary.add(entry_1) # adding 1st entry
      diary.add(entry_2) # adding 2nd entry
      expect { diary.reading_time(0) }.to raise_error("WPM must be positive.")
    end
  end

  context "when given multiple diary entries" do
    it "counts the total number of words in the entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Yesterday", "one two three") # new instance of class
      entry_2 = DiaryEntry.new("Today", "one two three") # a second instance
      diary.add(entry_1) # adding 1st entry
      diary.add(entry_2) # adding 2nd entry
      expect(diary.reading_time(2)).to eq 3
    end
  end

  context "when given multiple diary entries where it doesnt fit exactly" do
    it "counts the total number of words in the entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Yesterday", "one two ") # new instance of class
      entry_2 = DiaryEntry.new("Today", "one two three") # a second instance
      diary.add(entry_1) # adding 1st entry
      diary.add(entry_2) # adding 2nd entry
      expect(diary.reading_time(2)).to eq 3
    end
  end

  context "single entry within the reading time" do
    it "returns that entry" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("1", "one two")
      diary.add(entry_1)
      result = diary.find_best_entry_for_reading_time(2,1)
      expect(result).to eq entry_1
    end
  end

  context "single entry and NOT readable within the reading time" do
    it "returns nil" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("1", "one two three")
      #entry_2 = DiaryEntry.new("2", "three four five")
      #entry_3 = DiaryEntry.new("3", "six seven eight nine")
      #entry_4 = DiaryEntry.new("4", "ten eleven twelve thirteen fourteen")
      diary.add(entry_1)
      result = diary.find_best_entry_for_reading_time(2,1)
      expect(result).to eq nil
    end
  end

  context "between one readable and one unreadable" do
    it "selects the readable one" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("1", "one two three")
      entry_2 = DiaryEntry.new("2", "three four")
      diary.add(entry_1)
      diary.add(entry_2)
      result = diary.find_best_entry_for_reading_time(2,1)
      expect(result).to eq entry_2
    end
  end
end
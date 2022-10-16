require 'diary_entry'

RSpec.describe DiaryEntry do
  it "1. counts the words within the book" do
    entry = DiaryEntry.new("Book", "Once upon a time")
    result = entry.count_words
    expect(result).to eq 4
  end

  it "2. returns the title as a string" do
    entry = DiaryEntry.new("Book", "Once upon a time")
    result = entry.title
    expect(result).to eq "Book"
  end

  it "3. returns the contents as a string" do
    entry = DiaryEntry.new("Book", "Once upon a time")
    result = entry.contents
    expect(result).to eq "Once upon a time"
  end

  it "4. returns reading time as an integer" do
    entry = DiaryEntry.new("Book", "Once upon a time")
    result = entry.reading_time(4)
    expect(result).to eq 1
  end

  it "5. returns the amount of words that can be read" do
    entry = DiaryEntry.new("Book", "Once upon a time there was a good dog named Makers")
    result = entry.reading_chunk(5,2)
    expect(result).to eq "Once upon a time there was a good dog named"
  end
  it "6. returns the remaining words after the first x chunks has been taken out" do
    entry = DiaryEntry.new("Book", "Once upon a time there was a good dog named Makers and then we will just add more words so that the limit is exceeded")
    result = entry.reading_chunk(5,2)
    result2 = entry.reading_chunk(3, 4)
    expect(result2).to eq "Makers and then we will just add more words so that the"
  end
  # change to two expect statements instead!
  
end
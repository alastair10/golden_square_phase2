require 'todo'
require 'todo_list'
require 'diary'
require 'diary_entry'
require 'phone_numbers'

# Start testing Diary and DiaryEntry classes

describe "integration test for Diary and DiaryEntry" do
  context "1. when we add an entry to the diary" do
    it "adds the entry to a list" do
      diary = Diary.new 
      entry = DiaryEntry.new("Today", "I saw a dinosaur.")
      diary.add(entry)
      expect(diary.all).to eq [entry] 
    end
  end

  context "2. when we add multiple entries to the diary" do
    it "adds all entries to a list" do
      diary = Diary.new # new instance of class
      entry_1 = DiaryEntry.new("Yesterday", "I raced a cheetah.") # new instance of class
      entry_2 = DiaryEntry.new("Today", "I ate chocolate ice cream.") # a second instance
      entry_3 = DiaryEntry.new("Friday", "I went to Makers to learn how to run rspec tests.")
      diary.add(entry_1) # adding 1st entry
      diary.add(entry_2) # adding 2nd entry
      diary.add(entry_3) # adds 3rd entry
      expect(diary.all).to eq [entry_1, entry_2, entry_3] # list should be the diary entry 
    end
  end
  context "3. given multiple diary entries" do
    it "counts the words in the entries excluding the title" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Yesterday", "I ate crisps.") # new instance of class
      entry_2 = DiaryEntry.new("Today", "I ate chocolate ice cream.") # a second instance
      diary.add(entry_1) # adding 1st entry
      diary.add(entry_2) # adding 2nd entry
      expect(diary.count_words).to eq 8 
    end
  end
  context "4. between one readable and one unreadable" do
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
# Now we test ToDo and ToDoList classe#s
describe "integration test for ToDo and ToDoList" do
  context "5. add a todo" do
    it "lists out a single todo" do
      todo = Todo.new("take out rubbish")
      todo_list = TodoList.new
      todo_list.add(todo)
      expect(todo_list.all).to eq [todo]
    end
  end
  context "6. adds multiple todos" do
    it "lists both todos" do
      todo_1 = Todo.new("feed the beast")
      todo_2 = Todo.new("take out trash")
      todo_list = TodoList.new
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.all).to eq [todo_1, todo_2]
    end
  end
end

## Now we test DiaryEntry and PhoneNumbers classe#s

describe "integration test for DiaryEntry and PhoneNumbers" do
  
  context "7. takes a diary entry with a phone number" do
    it "extracts phone number" do
      diary = DiaryEntry.new("Ptolemy", "07477222222")
      number = PhoneNumbers.new
      result = number.extract_number(diary)
      expect(result).to eq("07477222222")
    end
  end

  context "8. takes a diary entry with a phone number" do
    it "extracts the name" do
      diary = DiaryEntry.new("Ptolemy", "07477111111")
      number = PhoneNumbers.new
      result = number.extract_name(diary)
      expect(result).to eq("Ptolemy")
    end
  end

  context "9. takes a diary entry with a phone number inside a string of text" do
    it "extracts the phone number" do
      diary = DiaryEntry.new("Kepler", "my friend game me their number 07477222222 on whatsapp")
      number = PhoneNumbers.new
      result = number.extract_number(diary)
      expect(result).to eq("07477222222")
    end
  end

  context "10. takes a diary entry with a non-phone number inside a string of text" do
    it "does not extract any number" do
      diary = DiaryEntry.new("Kepler", "my friend ate 12 cookies")
      number = PhoneNumbers.new
      result = number.extract_number(diary)
      expect(result).to eq("")
    end
  end

  context "11. takes a diary entry with a phone number" do
    it "loads the name and phone number into a hash" do
      diary = DiaryEntry.new("Copernicus", "my new friend game me their number 07477333333 on whatsapp")
      number = PhoneNumbers.new
      number.extract_name(diary)
      number.extract_number(diary)
      number.loader
      result = number.contact_list  
      expect(result).to eq({"Copernicus" => "07477333333"})
    end
  end 

  context "12. takes a diary entry without a phone number" do
    xit "does not extract a name" do
      diary = DiaryEntry.new("Kepler", "my new friend game me their number but I forgot it!")
      number = PhoneNumbers.new
      result = number.extract_name(diary)
      expect(result).to eq("")
    end
  end


  context "13. takes two diary entries with a phone number" do
    it "extracts both names and phone numbers and puts into a hash" do
      number = PhoneNumbers.new
      diary_entry_1 = DiaryEntry.new("Po Dameron", "my new friend game me their number 07477444444 on whatsapp")
      diary_entry_2 = DiaryEntry.new("Thanos", "my old friend changed their number to 07477555555")
      number.extract_name(diary_entry_1)
      number.extract_number(diary_entry_1)
      number.loader
      number.extract_name(diary_entry_2)
      number.extract_number(diary_entry_2)
      number.loader
      result = number.contact_list
      expect(result).to eq({"Po Dameron" => "07477444444", "Thanos" => "07477555555"})
    end
  end
end


# 1. Describe the Problem

  As a user
  So that I can record my experiences
  I want to keep a regular diary

  As a user
  So that I can reflect on my experiences
  I want to read my past diary entries

  As a user
  So that I can reflect on my experiences in my busy day
  I want to select diary entries to read based on how much time I have and my reading speed

  As a user
  So that I can keep track of my tasks
  I want to keep a todo list along with my diary

  As a user
  So that I can keep track of my contacts
  I want to see a list of all of the mobile phone numbers in all my diary entries



# 2. Design the Class System


┌──────────────────────────┐
│ Diary                    │
│ -----                    │
│                          │
│ -initialize              │
│ -add                     │
│ -all                     │
│                          │
│                          │
│                          │
└────────────^─────────────┘
             │
             │
Diary        │
will take    │
instance of  │
DiaryEntry   │
             │
             
┌──────────────────────────┐                   ┌────────────────────────┐
│ DiaryEntry               │                   │ PhoneNumbers           │
│ ----------               │                   │ ------------           │
│                          │    PhoneNumbers   │                        │
│ -initialize              │    takes instance │ -initialize            │
│ -title                   ├──────────────────►│ -extract_name          │
│ -contents                │    of DiaryEntry  │ -extract_number        │
│ -count_words             │                   │ -loader                │
│ -reading_time            │                   │ -contact_list          │
│ -reading_chunk           │                   │                        │
└──────────────────────────┘                   └────────────────────────┘

┌──────────────────────────┐
│ ToDo                     │
│ -----                    │
│                          │
│ -initialize              │
│ -task_item               │
│                          │
│                          │
│                          │
│                          │
└────────────┬─────────────┘
             │
             │ ToDoList takes instance
             │ of ToDo
             │
┌────────────▼─────────────┐
│ ToDoList                 │
│ ---------                │
│                          │
│ -initialize              │
│ -add                     │
│ -all                     │
│                          │
│                          │
└──────────────────────────┘

class Diary
  def initialize
  end

  def add(entry)
    # will take instance of DiaryEntry
  end 

  def all
    # returns a list of all entries
  end
end

class DiaryEntry
  def initialize (title, contents)
  end

  def title
    # returns title as a string
  end

  def contents
    # returns contents as a string
  end

  def count_words
    # returns the number of words in the contents
  end

  def reading_time(wpm)
    # calculates reading time of the contents
  end

  def reading_chunk (wpm, minutes)
    # returns the entry to read based off of time
  end
end

class ToDo
  def initialize(task)
    # takes task as a string 
  end

  def task_item
    # returns task as a string
  end
end

class ToDoList
  def initialize(todo)
    # takes instance of todo
  end

  def add
    # adds task to list
  end

  def all
    # returns list of all tasks
  end
end

class PhoneNumbers
  def initialize

  end

  def extract_name(diary)
    # takes instance of DiaryEntry and returns a name
    # will need to use title method from DiaryEntry

  end

  def extract_number(diary)
    # takes instance of DiaryEntry and returns the phone number
    # will need to use contents method from DiaryEntry
  end

  def loader
    # loads the contact information to a contact list
  end

  def contact_list
    # returns a hash of contact info
  end
end

# 3. Create Examples as Integration Tests

#  integration test for Diary and DiaryEntry
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

  # integration test for ToDo and ToDoList

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

# integration test for Diary and PhoneNumbers

describe "integration test for DiaryEntry and PhoneNumbers" do
  
  context "7. takes a diary entry with a phone number" do
    it "extracts phone number" do
      diary = DiaryEntry.new("Ptolemy", "07477222222")
      number = PhoneNumbers.new
      result = number.extract_number(diary)
      expect(result).to eq("07477222222")
    end
  end

  context "8. takes a diary entry without a phone number" do
    it "does not extract a number" do
      diary = DiaryEntry.new("Kepler", "my new friend game me their number but I forgot it!")
      number = PhoneNumbers.new
      result = number.extract_number(diary)
      expect(result).to eq("")
    end
  end

  context "9. takes a diary entry with a phone number" do
    it "extracts the name" do
      diary = DiaryEntry.new("Ptolemy", "07477111111")
      number = PhoneNumbers.new
      result = number.extract_name(diary)
      expect(result).to eq("Ptolemy")
    end
  end

  context "10. takes a diary entry with a phone number inside a string of text" do
    it "extracts the phone number" do
      diary = DiaryEntry.new("Kepler", "my friend game me their number 07477222222 on whatsapp")
      number = PhoneNumbers.new
      result = number.extract_number(diary)
      expect(result).to eq("07477222222")
    end
  end

  context "11. takes a diary entry with a non-phone number inside a string of text" do
    it "does not extract any number" do
      diary = DiaryEntry.new("Kepler", "my friend ate 12 cookies")
      number = PhoneNumbers.new
      result = number.extract_number(diary)
      expect(result).to eq("")
    end
  end

  context "12. takes a diary entry with a phone number" do
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


# 4. Create Examples as Unit Testsin

  # Diary
  diary = Diary.new
  expect(diary.all).to eq []

  # DiaryEntry
  entry = DiaryEntry.new("Today", "I saw a dinosaur")
  result = entry.count_words
  expect(result).to eq 4

  # ToDo
  todo = Todo.new("do laundry")
  expect(todo.task_item).to eq "do laundry"

  # ToDoList
  todo_list = ToDoList.new("pay bills")
  todo_list.add
  expect(todo_list.all).to eq ["pay bills"]

  # PhoneNumbers
  number = PhoneNumbers.new("07477123456 is my friends number")
  number.extract_number.to eq (["07477123456"])



  # ASSUMPTIONS!

  # title of the diary entry will be the person's name, if there is a number in the diary entry
  # the phone number will always begin with a 0 and 11 digits long

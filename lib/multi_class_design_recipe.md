

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
└────────────┬─────────────┘
             │
             │
DiaryEntry   │
will take    │
instance of  │
Diary        │
             │
             ▼
┌──────────────────────────┐                   ┌────────────────────────┐
│ DiaryEntry               │                   │ PhoneNumbers           │
│ ----------               │                   │ ------------           │
│                          │    PhoneNumbers   │                        │
│ -initialize              │    takes instance │ -initialize            │
│ -title                   ├──────────────────►│ -extract_number        │
│ -contents                │    of DiaryEntry  │ -contact_list          │
│ -count_words             │                   │                        │
│ -reading_time            │                   │                        │
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
             │ of ToDo list
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

  def extract_number(diary)
    # takes instance of diary and extracts number
  end

  def contact_list
    # returns a list of contacts
  end
end

# 3. Create Examples as Integration Tests

#  integration test for Diary and DiaryEntry
  context "when we add an entry to the diary" do
    it "adds the entry to a list" do
      diary = Diary.new 
      entry = DiaryEntry.new("Today", "I saw a dinosaur.")
      diary.add(entry)
      expect(diary.all).to eq [entry] 
    end
  end

  context "when we add multiple entries to the diary" do
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

  # integration test for ToDo and ToDoList

  describe "Todo Integration" do
  context "1. add a todo" do
    it "lists out the incomplete todo" do
      todo = Todo.new("take out rubbish")
      todo_list = TodoList.new
      todo_list.add(todo)
      expect(todo_list.incomplete).to eq [todo]
    end
  end

  context "2. adds a completed todo" do
    it "lists the completed todo" do
      todo = Todo.new("take out rubbish #DONE")
      todo_list = TodoList.new
      todo_list.add(todo)
      expect(todo_list.complete).to eq [todo]
    end
  end

  context "3. adds one complete and one incomplete todo each" do
    it "lists only the incompelete todo" do
      todo_1 = Todo.new("fold shirts #DONE")
      todo_2 = Todo.new("take out trash")
      todo_list = TodoList.new
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.incomplete).to eq [todo_2]
    end
  end

  context "4. adds two complete and two incomplete todos" do
    it "lists only the compelete todos" do
      todo_1 = Todo.new("fold shirts #DONE")
      todo_2 = Todo.new("take out trash")
      todo_3 = Todo.new("wash dishes #DONE")
      todo_4 = Todo.new("sweep floor")
      todo_list = TodoList.new
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_list.add(todo_4)
      expect(todo_list.complete).to eq [todo_1, todo_3]
    end
  end

  context "5. takes all todos" do
    it "marks all as complete" do
      todo_list = TodoList.new
      todo_1 = Todo.new("fold shirts")
      todo_2 = Todo.new("take out trash")
      todo_3 = Todo.new("wash dishes")
      todo_4 = Todo.new("sweep floor")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_list.add(todo_4)
      result = todo_list.give_up!
      expect(result).to eq ["fold shirts #DONE", "take out trash #DONE", "wash dishes #DONE", "sweep floor #DONE"]
    end
  end

# integration test for Diary and PhoneNumbers

  context "1. takes a diary entry with a phone number" do
    it "extracts the phone number and puts in array" do
      diary = DiaryEntry.new("today", "my new friend game me their number 07477123456 on whatsapp")
      number = PhoneNumbers.new
      number.extract_number(diary)
      result = number.contact_list  
      expect(result).to eq ["07477123456"]
    end
  end

  context "2. takes two diary entries with a phone number" do
    it "extracts both phone number and puts in array" do
      number = PhoneNumbers.new
      diary_1 = DiaryEntry.new("today", "my new friend game me their number 07477123456 on whatsapp")
      diary_2 = ("yesterday", "my old friend changed their number to 07477654321")
      number.extract_number(diary)
      result = number.contact_list
      expect(result).to eq ["07477123456", "07477654321"]
    end
  end

  context "3. takes diary entry without a phone number" do
    it "returns empty array" do
      number = PhoneNumbers.new
      diary_1 = DiaryEntry.new("today", "my new friend went to the store")
      number.extract_number(diary)
      result = number.contact_list
      expect(result).to eq []
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
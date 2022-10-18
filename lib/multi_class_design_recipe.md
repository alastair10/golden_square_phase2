

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

┌──────────────────────────┐                  ┌────────────────────────┐
│ Diary                    │                  │ PhoneNumbers           │
│ -----                    │                  │ ------------           │
│                          │ PhoneNumbers     │                        │
│ -initialize              │  will take       │ -initialize            │
│ -add                     ├─────────────────►│ -extract_number        │
│ -all                     │  instance of     │ -contact_list          │
│                          │  Diary           │                        │
│                          │                  │                        │
│                          │                  │                        │
└────────────┬─────────────┘                  └────────────────────────┘
             │
             │
Diary        │
will take    │
instance of  │
DiaryEntry   │
             │
┌──────────────────────────┐
│ DiaryEntry               │
│ ----------               │
│                          │
│ -initialize              │
│ -title                   │
│ -contents                │
│ -count_words             │
│ -reading_time            │
│ -entry_selection         │
└──────────────────────────┘

┌──────────────────────────┐
│ ToDo                     │
│ -----                    │
│                          │
│ -initialize              │
│ -task_item               │
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

  def entry_selection (wpm, minutes)
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
  def initialize(diary)
    # takes instance of Diary
  end

  def extract_number
    # returns list of numbers from the diary entries
  end

  def contact_list
    # returns a list of contacts
  end
end

# 3. Create Examples as Integration Tests

  context "when we add an entry to the diary" do
    it "adds the entry to a list" do
      diary = Diary.new 
      entry = DiaryEntry.new("Today", "I ate crisps.")
      diary.add(entry)
      expect(diary.all).to eq [entry] 
    end
  end






# 4. Create Examples as Unit Tests

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
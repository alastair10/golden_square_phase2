

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
│ -add                     ├─────────────────►│ -add                   │
│ -all                     │  instance of     │ -extract_number        │
│ -count_words             │  Diary           │                        │
│ -reading_time            │                  │                        │
│                          │                  │                        │
└────────────┬─────────────┘                  └────────────────────────┘
             │
             │
DiaryEntry   │
will take    │
instance of  │
Diary        │
             │
             ▼
┌──────────────────────────┐
│ DiaryEntry               │
│ ----------               │
│                          │
│ -initialize              │
│ -title                   │
│ -contents                │
│ -count_words             │
│ -reading_time            │
│ -reading_chunk           │
└──────────────────────────┘

┌──────────────────────────┐
│ ToDo                     │
│ -----                    │
│                          │
│ -initialize              │
│ -task                    │
│ -mark_done!              │
│ -done?                   │
│                          │
│                          │
└────────────┬─────────────┘
             │
             │ ToDoList takes instance
             │ of ToDo list
             ▼
┌──────────────────────────┐
│ ToDoList                 │
│ ---------                │
│                          │
│ -initialize              │
│ -add                     │
│ -incomplete              │
│ -complete                │
│                          │
└──────────────────────────┘

class PhoneNumbers
  def initialize
  end

  def add
    # will add diary entries to a list
  end

  def extract
    # extracts entries with a phone number in them
    # adds entries to a new list
  end

  def all
    #returns list of phone numbers 
  end
end


# 3. Create Examples as Integration Tests

# integration test for ToDo and ToDoList

task = ToDo.new("clean kitchen")
todo_list = ToDoList.new()
todo_list.add
expect(todo_list.incomplete).to eq [task]

# inegration test for Diary and DiaryEntry

diary = Diary.new
diary_entry_1 = DiaryEntry.new("today", "I saw a dinosaur")
diary_entry_2 = DiaryEntry.new("yesterday", "I jumped out of a plane")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.count_words
diary.reading_time(2)







# 4. Create Examples as Unit Tests
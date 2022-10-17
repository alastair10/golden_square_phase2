

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
│ -add                     ├───────────────────────────────────┐
│ -all                     │                                   │
│                          ├──────────────┐                    │
│                          │              │                    │
│                          │              │                    │
│                          │              │                    │
└──────────────────────────┘              │                    │
                                          │                    │
                                 Diary has│                    │
                                          │                    │
 ┌─────────────────────────┐     one or more entries           │
 │ DiaryEntry              │              │                    │
 │ ----------              │              │                    │
 │                         │              │                    │
 │ -select_entry           │              │                    │
 │ -entry_based_on_time    │◄─────────────┘                    │
 │                         │                                   │
 │                         │                                   │
 │                         │                                   │
 │                         │                                   │
 └─────────────────────────┘                                   │
                                                               │
                                                               │
 ┌─────────────────────────┐                                   │
 │ ToDo                    │                                   │
 │ -----                   │                                   │
 │                         │                                   │
 │ -add                    │                                   │
 │ -all                    │                                   │
 │                         │                                   │
 │                         │                                   │
 │                         │                                   │
 │                         │                                   │
 └─────────────────────────┘                                   │
                                   Diary has one or more       │
  ┌────────────────────────┐       entries with numbers in it  │
  │ PhoneNumbers           │                                   │
  │                        │                                   │
  │ -add                   │                                   │
  │ -extract_number        ◄───────────────────────────────────┘
  │ -all                   │
  │                        │
  │                        │
  │                        │
  │                        │
  └────────────────────────┘

class Diary
  def initialize(title, entry)
  end

  def add(entry)
  end

  def all
    #returns list of all diary entries
  end
end

class DiaryEntry
  def initialize
  end

  def select_entry
  end

  def entry_based_on_time(wpm, minutes)
  end
end



class ToDo
  def initialize
  end

  def add(todo)
  end

  def all
  end
end

class PhoneNumbers
  def initialize
  end

  def add
    # This will add diary entries
  end

  def extract
    # This will extract the numbers from entries
  end

  def all
    # returns list of numbers
  end
end


# 3. Create Examples as Integration Tests












# 4. Create Examples as Unit Tests
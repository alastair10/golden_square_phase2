require 'todo'
require 'todo_list'
require 'diary'
require 'diary_entry'
require 'phone_numbers'

describe "integration test for Diary and DiaryEntry" do
  context "1. when we add an entry to the diary" do
    it "adds the entry to a list" do
      diary = Diary.new 
      entry = DiaryEntry.new("Today", "I saw a dinosaur.")
      diary.add(entry)
      expect(diary.all).to eq [entry] 
    end
  end

  context "when we add multiple entries to the diary" do
    xit "2. adds all entries to a list" do
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
    xit "3. counts the words in the entries excluding the title" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Yesterday", "I ate crisps.") # new instance of class
      entry_2 = DiaryEntry.new("Today", "I ate chocolate ice cream.") # a second instance
      diary.add(entry_1) # adding 1st entry
      diary.add(entry_2) # adding 2nd entry
      expect(diary.count_words).to eq 8 
    end
  end

  context "between one readable and one unreadable" do
    xit "4. selects the readable one" do
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

describe "integration test for ToDo and ToDoList" do
  context "5. add a todo" do
    xit "lists out the incomplete todo" do
      todo = Todo.new("take out rubbish")
      todo_list = TodoList.new
      todo_list.add(todo)
      expect(todo_list.incomplete).to eq [todo]
    end
  end

  context "6. adds a completed todo" do
    xit "lists the completed todo" do
      todo = Todo.new("take out rubbish #DONE")
      todo_list = TodoList.new
      todo_list.add(todo)
      expect(todo_list.complete).to eq [todo]
    end
  end

  context "7. adds one complete and one incomplete todo each" do
    xit "lists only the incompelete todo" do
      todo_1 = Todo.new("fold shirts #DONE")
      todo_2 = Todo.new("take out trash")
      todo_list = TodoList.new
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.incomplete).to eq [todo_2]
    end
  end

  context "8. adds two complete and two incomplete todos" do
    xit "lists only the compelete todos" do
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

  context "9. takes all todos" do
    xit "marks all as complete" do
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
end

describe "integration test for DiaryEntry and PhoneNumbers" do
  context "10. takes a diary entry with a phone number" do
    xit "extracts the phone number and puts in array" do
      diary = DiaryEntry.new("today", "my new friend game me their number 07477123456 on whatsapp")
      number = PhoneNumbers.new
      number.extract_number(diary)
      result = number.contact_list  
      expect(result).to eq ["07477123456"]
    end
  end

  context "11. takes two diary entries with a phone number" do
    xit "extracts both phone number and puts in array" do
      number = PhoneNumbers.new
      diary_1 = DiaryEntry.new("today", "my new friend game me their number 07477123456 on whatsapp")
      diary_2 = ("yesterday", "my old friend changed their number to 07477654321")
      number.extract_number(diary)
      result = number.contact_list
      expect(result).to eq ["07477123456", "07477654321"]
    end
  end

  context "12. takes diary entry without a phone number" do
    xit "returns empty array" do
      number = PhoneNumbers.new
      diary_1 = DiaryEntry.new("today", "my new friend went to the store")
      number.extract_number(diary)
      result = number.contact_list
      expect(result).to eq []
    end
  end
end
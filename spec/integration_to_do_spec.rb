require "todo"
require "todo_list"

describe "Todo Integration" do
  context "1. add a todo" do
    it "lists out the incomolete todo" do
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

  context "takes all todos" do
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
end
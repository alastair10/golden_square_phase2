require "todo"

describe "#Todo" do
  context "1. given a task" do
    it "returns the task as a string" do
      todo = Todo.new("do laundry")
      expect(todo.task).to eq "do laundry"
    end
  end

  context "2. when a task is complete" do
    it "marks the todo as done" do
      todo = Todo.new("do dishes")
      todo.task
      todo.mark_done!
      result = todo.done?
      expect(result).to eq true
    end
  end

  context "3. when a task is NOT complete" do
    it "does NOT return it as done" do
      todo = Todo.new("do dishes")
      todo.task
      result = todo.done?
      expect(result).to eq false
    end
  end
end
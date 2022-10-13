require 'single_class_program'

describe ToDoList do
  it "displays an empty array" do
    my_task = ToDoList.new
    result = my_task.display_tasks
    expect(result).to eq []
  end

  it "adds a task to the list" do
    my_task = ToDoList.new
    my_task.add_task("sweep the floor")
    result = my_task.display_tasks 
    expect(result).to eq ["sweep the floor"]
  end

  it "adds a second task to the list" do
    my_task = ToDoList.new
    my_task.add_task("sweep the floor")
    my_task.add_task("take out the trash")
    result = my_task.display_tasks 
    expect(result).to eq ["sweep the floor", "take out the trash"]
  end

  it "removes a task from the list" do
    my_task = ToDoList.new
    my_task.add_task("sweep the floor")
    my_task.add_task("take out the trash")
    my_task.marked_complete("sweep the floor")
    result = my_task.display_tasks 
    expect(result).to eq ["take out the trash"]
  end

  it "returns an error when the task does not exist" do
    my_task = ToDoList.new
    expect {my_task.marked_complete("sweep the floor")}.to raise_error "Item is not in your list. Please check the list."

  end
end
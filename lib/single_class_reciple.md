{{PROBLEM}} Class Design Recipe
1. Describe the Problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.


2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

class ToDoList
  def initialize
    @todo = []
  end

  def add_task(task)
    # adds a task to the todo list
  end

  def display_tasks
    # prints the todo list
    @todo  
  end

  def marked_complete(task)
    # removed the task from the todo list
  end
end


3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

# displaying an empty task list
my_task = ToDoList.new
my_task.display_tasks => []

# adding a task to the list
my_task = ToDoList.new
my_task.add_task("sweep the floor")
my_task.display_tasks => ["sweep the floor"]

# returns multiple to do's
my_task = ToDoList.new
my_task.add_task("sweep the floor")
my_task.add_task("take out the trash")
my_task.display_tasks => ["sweep the floor", "take out the trash"]

# removing a task from the list
my_task = ToDoList.new
my_task.add_task("sweep the floor")
my_task.add_task("take out the trash")
my_task.marked_complete("sweep the floor")
my_task.display_tasks => ["take out the trash"]

# attempting to delete when the to do is not in the list
my_task = ToDoList.new
my_task.marked_complete("sweep the floor") => "Item is not in your list. Please check the list."


4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
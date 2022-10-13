class ToDoList
  def initialize
    @todo = []
  end

  def add_task(task)
    # adds a task to the todo list
    @todo << task
  end

  def display_tasks
    # prints the todo list
    @todo  
  end

  def marked_complete(task)
    # removed the task from the todo list
    fail "Item is not in your list. Please check the list." if !@todo.include?(task)
    @todo.delete(task)

  end
end
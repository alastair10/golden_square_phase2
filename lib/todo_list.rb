class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @todo_list << todo
  end

  def incomplete
    # Returns all non-done todos
    @todo_list.filter do |todo|
      !todo.done?
    end
  end

  def complete
    # Returns all complete todos
    @todo_list.filter do |todo| 
      todo.done?
    end
  end

  def give_up!
    # Marks all todos as complete
    return @todo_list.map do |todo|
      todo.mark_done!
    end
  end
end
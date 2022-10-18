class Todo
  def initialize(task) # task is a string
    @task = task
    @list = []
    @done = []
  end

  def task
    # Returns the task as a string
    @list << @task
    return @list.join("")
  end

  # def mark_done!
  #   # Marks the todo as done
  #   # Returns nothing
  #   @done = @task.concat(" #DONE")
  # end

  # def done?
  #   # Returns true if the task is done
  #   # Otherwise, false
  #   return @task.include?("#DONE")
  # end
end
def checker(str)
  match = "#TODO"
  words = str.split
  to_do_list = []
  if words.include?(match)
    to_do_list << str
    return "To Do List: #{to_do_list.join("")}"
  else
    return "To Do List:"
  end 
end
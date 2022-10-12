def snippet(str)
  my_array = str.split
  if my_array.length > 5
    my_array2 = my_array[0,5]
    return my_array2.join(" ") + "..."
  else
    return str
  end
end
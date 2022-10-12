def calc_reading_time(str)
  words = str.split.length
  speed = 200
  if words%speed == 0
    return words/speed
  else
    return words.to_f/speed.to_f
  end
end
class DiaryEntry

  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @counter = 0
  end

  def title
    # Returns the title as a string
    @title.to_s
  end

  def contents
    # Returns the contents as a string
    @contents.to_s
  end

  def count_words
    return @contents.empty? ? 0 : @contents.split.count
    # could also implement using @contents.count(" ") + 1
    # saves computer from creating a potentially massive list
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the
                        # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    fail "WPM must be positive." unless wpm.positive?
    return (count_words / wpm.to_f).ceil
  end
  
  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    text_chunk = @contents.split.slice(@counter, (wpm * minutes))
    @counter += (wpm * minutes)
    return text_chunk.join(" ")
  end
end
## 1. Describe the Problem

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature

reading_time_calc: calculates the reading time based on word count; in minutes


## 3. Create Example as Tests

word_count("hello world") => 2
word_count("") => 0
word_count("one two three four") => 4

reading_time_calc(200) => 1 minute
reading_time_calc(0) => 0 minutes
reading_time_calc(100) => 0.5 minutes
reading_time_calc(600) => 3 minutes


## 4. Implement the Behaviour


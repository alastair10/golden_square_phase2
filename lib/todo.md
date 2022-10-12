## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

if it is a ToDo, add it to a to do list and prints it.
keep asking user for strings until they are done inputting <-- going to need way more time to implement this so will stop the recording.

## 2. Design the Method Signature

words: an array that holds each word of the string
match: a string that holds the search word "#TODO"
get input: recieves the input from the user
to_do_list: an array of the to do's

## 3. Create Example as Tests

checker("") => "To Do List: "
checker("#TODO") => "yes"
checker("wash socks") => "no"
checker("wash socks #TODO") => "yes"
checker("#TODO brush teeth") => "yes"
checker("fold #TODO laundry") => "yes"
checker("take out trash #TO DO") = "no"





## 4. Implement the Behaviour


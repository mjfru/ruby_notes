#! Ruby Methods, Blocks, & Sorting

#! Method Syntax in Ruby:
=begin 
* Methods are defined using the keyword 'def' (def-ine) and consist of three parts:
    ? 1. The Header, which includes the def keyword, the name of the method, and any arguments it takes.
    ? 2. The Body, which is the code block that describes the procedures the method carries out.
    ?       The body is indented two spaces by convention (as with our for, if, elsif, and else statements.)
    ? 3. The method ends with the 'end' keyword.

Here's a simple example that just prints something:
=end

def welcome
    puts "Ruby time!"
end

=begin
* Making a function is just part of the process however, it's useless until we -call- it.
If the program doesn't find a method matching the name you called, you'll get a NameError returned to you.
* You call a method simply by typing its name!
=end

def array_of_5
    puts (1..5).to_a
end

array_of_10

#! Parameters & Arguments
=begin
If a method takes arguments, we say it accepts or expects those arguments.
We might define a function, square, like this:
=end

def square(n)
    puts n ** 2
end

square(12) # Will print 144

=begin
* The argument is the piece of code you actually put between the method's parentheses when you -call- it, and the parameter is the name you put between the method's parathesis when you -define- it.
? In our example above, we gave the function square the 'n' parameter and passed in 12 as its argument when we called it.
Parameters are placeholders the method definition gives to arguments since it doesn't knwo ahead of time what it's going to get.
=end

def cubertino(n)
    puts n ** 3
end

cubertino(8)


#! Splat Arguments
=begin
* Methods don't know what arguments they're going to receive or, sometimes, how many will be passed into them!

Let's say you have a method, friend, that puts the argument it receives from the user.
It might look like this:
=end

def friend(name)
    puts "My friend is " + name + "."
end

=begin
This is great for just one friend but what if you wanted to print out ALL the user's friends without knowing how many there will be?
* The solution: splat arguments - arguments preceded by an asterisk *.
? This tells the program that the method can receive one or more arguments.
=end

def what_up(greeting, *friends)
    friends.each { |friend| puts "#{greeting}, #{friend}!" }
end

what_up("What up", "Ian", "Zoe", "Zenas", "Eleanor")
what_up("what up", "Ian", "Zoe")

#! Return
=begin
Sometimes we don't want a method to print something to the console but actually -return- a value.
For that we use, well, return!
=end

def double(n)
    return n * 2
ends

output = double(6)
output += 2
puts output

=begin
In this example, we first defined a new method called double that accepts one parameter, n.
Inside the method, we return 2 * n.
After that, we call our new double method with an argument of 6 and store the result in output.
Then, we increase output to 14 (with += 2) and print it to the console.
=end

def add(num1, num2)
    return num1 + num2
end

def greeter(name)
    return "Hello, '#{name}'."
end

def by_three?(number)
    if number % 3 == 0
        return true
    else
        return false
    end
end

#! The Difference Between Blocks & Methods
=begin
Reference the code below to understand these notes.
? The capitalize method...capitalizes a word and we can continually invoke the capitalize method.

* However, the block that we define (following .each) will only be called -once-, and in the context of the array that we are iterating over.
It appears just long enough to do some work for each, then vanishes into the night!
=end

# method that capitalizes a word
def capitalize(string) 
    puts "#{string[0].upcase}#{string[1..-1]}"
end

capitalize("ryan") # prints "Ryan"
capitalize("jane") # prints "Jane"

# block that capitalizes each string in the array
["ryan", "jane"].each {|string| puts "#{string[0].upcase}#{string[1..-1]}"} # prints "Ryan", then "Jane"

#! Using Code Blocks
=begin
A method -can't- take a block as a parameter.
? That's what .each has been doing this whole time: taking a block as a parameter and doing stuff with it!
You just didn't notice because we didn't use the optional parentheses...sneaky sneaky!

* Passing a block to a method is great way of abstracting certain tasks from the method and defining those tasks when we call the method.
? Abstraction is an important idea in computer science and you can think of it as meaning "making somthing simpler".
Just like saying 'house' simplifies its components when you're 'house-hunting', using a block to define the tasks you want the method (like .each) to do simplifies the task at hand.
=end

# The block, {|i| puts i}, is passed the current
# array item each time it is evaluated. This block
# prints the item. 
[1, 2, 3, 4, 5].each { |i| puts i }

#? Modify the block so it will print each item in the array multiplied by five.
[1, 2, 3, 4, 5].each { |i| puts i*5 }

#! Introduction to Sorting
=begin
* Ruby comes out of the box with quite a few built-in sort mechanisms / libraries
? Let's check out the .sort! method to organize values in an array:
=end

my_array = [3, 4, 8, 7, 1, 6, 5, 9, 2]
puts(my_array.sort!) # [1, 2, 3, 4, 5, 6, 7, 8, 9]

#! Foundations
=begin
* Most sorting algorithms assume we are sorting an array of items, which involves comparing any two items in the array and decided which should come first.
If we were to arrange some books, sorted by title, for example, we could devise a strategy for sorting.
These "strategies" are the sorting algorithms mentioned in the previous example.
We need to compare two items in the list and let Ruby decide which strategy to use.
=end

books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]

#? What Ruby method could we call on books in order to sort the list of books alphabetically?
puts(books.sort!) 
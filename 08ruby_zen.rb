#! The Zen of Ruby
#! Ruby strives to be a language that programmers find easy and fun to use.

#! A Simpler 'If'
# We've seen this plenty of times by now:
if conditional
    puts "It's happening!"
end

#* If the thing the conditional do is short, however, we can fit this all into one line like so:

puts "It's happening!" if true

#* Ruby expects an expression followed by if followed by a boolean and this order is important!

#! You - cannot - do this, however:
if true puts "It's true!"

#? It's also important to note that you don't need an - end - when you write your - if - statement all on one line.


#! The One-Line Unless
=begin
You can do the same exact thing with the unless statement.
The order is the same as before: something for Ruby to do, the unless keyword, and then an expression that evaluates to true or false.
Remember, you don't need an end when you write a one-line - if - or - unless -!
=end

busy = false
puts "I'll do it!" unless busy


#! Ternary Statements in Ruby
=begin
As in other programming languages, a ternary statement is a more concise version of an if/else statement.
? It's 'ternary' because it takes -3- values: a boolean, an expression to evaluate if true, and an expression to evaluate if false.
* The syntax looks like this:
*   boolean ? Do this if true: Do this if false
=end

puts 3 < 4 ? "3 is less than 4!" : "3 is not less than 4."

#! The order of arguments is important and you don't need an end for ternary statements!

is_weekend = true

puts is_weekend ? "It's the weekend! Let's sleep a little longer." : "Time to get up for work!"


#! When & Then: The Case Statement
=begin
The if / else statement is powerful, but we can get bogged down in 'if's and 'elsif's if we have a lot of conditions to check.
? Thankfully, Ruby provides us with a concise alternative: the case statement.
* The syntax looks like this:
=end
case language
    when "JS"
        puts "Websites!"
    when "Python"
        puts "Science!"
    when "Ruby"
        puts "Web Apps!"
    else
        puts "I don't know!"
end

#? OR, we can fold it up like this:
case language
    when "JS" then puts "Websites!"
    when "Python!" then puts "Science!"
    when "Ruby" then puts "Web Apps!"
    else puts "I don't know!"
end

puts "Hello there!"
greeting = gets.chomp

case greeting
    when "English" then puts "Hello!"
    when "French" then puts "Bonjour!"
    when "German" then puts "Guten Tag!"
    when "Finnish" then puts "Haloo!"
    else puts "I don't know that language!"
end


#! Conditional Assignment
=begin
We've seen that we can use the '=' operator to assign a value to a variable.
? But, what if we only want to assign a variable if it hasn't already been assigned?

* For this, we can use the conditional assignment operator ||=.
* It's made up of the or ( | | ) logical operator and the normal '=' assignment operator.
=end

favorite_book = nil                                     #! Initially set to nil; nothing
puts favorite_book

favorite_book ||= "Cat's Cradle"                        #! No value set, so sets new value
puts favorite_book

favorite_book ||= "Why's (Poignant) Guide to Ruby"      #! It will ignore this one!
puts favorite_book

favorite_book = "Why's (Poignant) Guide to Ruby"        #! Reassigns the variable here
puts favorite_book


favorite_language ||= "JavaScript"
puts favorite_language


#! Implicit Return
=begin
We knwo that methods in Ruby can return values, and we ask a method to return a value when we want to use it in another part of our program.
? What if we don't put a return statement in our method definition though?

For instance, if you don't tell a JavaScript function exactly what to return, it'll return undefined.
Python, the default return value is None.
* But for Ruby, it's something different: Ruby's methods will return the result of the last evaluated expression.
This means that if you have a Ruby method like this one:
=end

def add(a, b)
    return a + b
end

#* You can simply write:

def add(a, b)
    a + b
end

def multiple_of_three(n)
    n % 3 == 0 ? "True" : "False"
end


#! Picking the Right Tool for the Job
=begin
Eventually, you're going to need to perform a repetitive task in your programs.
Many programming languages allow you to do this with a - for - loop and while Ruby does include - for - loops, there are better tools available to us!

If we want to do something a specific amount of time, we can use the .times method, like so:
=end

5.times{ puts "Heyo!" }

# If we want to repeat an action for every element in a collection, we can use .each:
[1, 2, 3].each { |x| puts x * 10 } # Prints 10, 20, 30 on seperate lines

#? Let’s get a little inventive. Write a loop that only puts the even values of my_array. (Bonus points if you use a one-line if!)
my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
my_array.each { |num| puts num unless num % 2 !=0 }


#! Up the Down Staircase
=begin
* If we know the range of numbers we'd like to include, we can use .upto and .downto.
This is much more Rubyist solution than trying to use a for loop that stops when a counter variable hits a certain value.

? We might use .upto to print out a specific range of values:
=end

90.upto(100) { |num| print num, " "}
# 91..99, 100

=begin
? And we can use .downto to do the same thing with descending values.
=end

#? Letters also work!
#? Use .upto to puts the capital letters "L" through "P".
"L".upto("P") { |letter| puts letter}


#! Call & Response
=begin
* respond_to? takes a symbol and returns true if an object can receive that method and false if otherwise.
For example:
=end

[1, 2, 3].respond_to?(:push)
#? This would return true, since you can call .push on an array object. However...

[1, 2, 3].respond_to?(:to_sym)
#? Would return false, since you can't turn an array into a symbol.

#? Rather than checking to see if our age variable is an integer, check to see if it will .respond_to? the .next method.
age.respond_to?(:next)
# true


#! Being Pushy
=begin
Ruby has some nice shortcuts for common method names.
As luck would have it, one of those is for .push!

* Instead of typing out the .push method name, you can simply use <<, the concatenation operator (also known as 'the Shovel') to add an element to the end of an array.
=end

[1, 2, 3] << 4  # [1, 2, 3, 4]

#? It also works on strings!
"Yukihiro" << "Matsumoto"   # "Yukihiro Matsumoto"

#? Update the code in the editor to use the concatenation operator instead of .push and +.
#? puts the caption

alphabet = ["a", "b", "c"]
alphabet << "d"

caption = "A giraffe surrounded by "
caption << "weezards!"
puts caption


#! String Interpolation
#* You can also use plain old '+' or '<<' to add a variable value into a string:
drink = "espresso"
"I love " + drink # ==> I love espresso
"I love " << drink # ==> I love espresso

#? But if you want to do it for non-string values, you have to use .to_s to make it a string:
age = 26
"I am " + age.to_s + " years old." # ==> I am 26 years old.
"I am " << age.to_s + " years old."

#* This is complicated...and complicated is not the Ruby way!
#? A better way to do this is with string interpolation:
"I love #{drink}."
"I am #{age} years old."

#* All you need to do is place the variable name inside #{} within a string!

#? Remove the concatenation operator and rewrite the code to use #{thing}.
favorite_things = ["Ruby", "espresso", "candy"]

puts "A few of my favorite things:"

favorite_things.each do |thing|
    puts "I love #{thing}"!"
end

#! Review Exercises:

#? 1.  Refactor the contents of the editor to just one line of code:
if 1 < 2
    puts "One is less than two!"
end

puts "One is less than two!" if 1 < 2

#? Refactor the if statement in the editor to use a ternary operator to puts the correct sentence.

if 1 < 2
    puts "One is less than two!"
else
    puts "One is not less than two."
end

puts 1 < 2 ? "One is less than two!" : "One is not less than two."

#? Refactor the if/elsif/else statement in the editor into a tidy case statement.

puts "What's your favorite language?"
language = gets.chomp

if language == "Ruby"
    puts "Ruby is great for web apps!"
elsif language == "Python"
    puts "Python is great for science."
elsif language == "JavaScript"
    puts "JavaScript makes websites awesome."
elsif language == "HTML"
    puts "HTML is what websites are made of!"
elsif language == "CSS"
    puts "CSS makes websites pretty."
else
    puts "I don't know that language!"
end

case language
    when "Ruby" then puts "Ruby is great for web apps!"
    when "Python" then puts "Python is great for science."
    when "JavaScript" then puts "JavaScript makes websites awesome."
    when "HTML" then puts "HTML is what websites are made of!"
    when "CSS" then puts "CSS makes websites pretty."
    else puts "I don't know that language!"
end

#? Create a variable called favorite_animal and conditionally assign it to a string containing the name of your favorite animal.

favorite_animal ||= "Dog"

#? Write a method, square, that takes a number as an argument and implicitly returns the square of that number.

def square(number)
    number * number
end

#? Let’s finish up by refactoring the for loop on the right to use .times instead.

for i in (1..3)
    puts "I'm a refactoring master!"
end

3.times do
    puts "I'm a refactoring master!"
end
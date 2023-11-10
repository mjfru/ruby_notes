#! Ruby - Introduction

#! Variables & Data Types: Numbers, Strings, Booleans
=begin
#* Like all programming languages, Ruby takes information in different types.
#? This section will cover strings, numeric, and booleans.
To declare a variable and set it to one of these values, the syntax is very similar to Python.
#* Declare a name for your variable and use '=' to assign it a value of any type.
For example:
my_bool = true
my_num = 11
my_string = "Ruby"
=end

#! 'puts' and 'print'
=begin
#* The print command, again like in Python, simply takes whatever follows it and displays it in the console.
#* The puts command is a little different; it adds a new line after the thing you want to print.

puts "Hello!"
print "How are you?"
end

#! Math
=begin
Math is also nearly identical to most other programming languages.
The six arithmetic operators to focus on to start with include:

- Addition (+)
- Subtraction (-)
- Multiplication (*)
- Division (/)
- Exponentiation (**)
- Modulo (%)

#? For example:
puts 2 + 5 # will display 7 in the console.
puts 4 % 2 # displays 0
=end

#! Methods
=begin
Methods are used by utilizing dot . notation.

Some common, introductory ones are listed below:
=end

#! .length - Provides the amount of characters in a string
puts "I love Ruby!".length
#? Outputs 12

#! .reverse - Provides a backwards/reverse version of whatever string it's called on.
puts "Red".reverse
#? Outputs deR
color = "Black"
puts color.reverse
#? Outputs "kcalB"

#! .upcase & .downcase - Changes a string to -all- uppercase or lowercase, respectively.
city = Boston
city.upcase
#? Outputs BOSTON
city.downcase
#? Outputs boston

#! Single-Line comments - A '#' denotes a single-line comment.
# As has been used many, many times already in this note page.

#! Multi-Line Comments - Spans multiple lines and begins with =begin & ends with =end.
=begin
Here is
an example
of a multi-line comment.
=end 
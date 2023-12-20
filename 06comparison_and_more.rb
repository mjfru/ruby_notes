#! The Combined Comparison Operator
=begin
In Ruby, there is also something called the combined comparison operator to compare two Ruby objects.
* The combined comparison operator looks like this: <=>.
It returns 0 if the first operand (item to be bec compared) equals the second.
If the first operand is greater than the second, it returns 1.
It returns -1 if the first operand is less than the second.

* A block that is passed into the sort method must return either 1, 0, or -1.
It should return -1 if the first block parameter should come before the second, 1 if vice-versa, and 0 if they are of equal weight, meaning one does not come before the other (i.e. if two values are equal).
=end

book_1 = "A Wrinkle in Time"

book_2 = "A Brief History of Time"

puts(book_1 <=> book_2) # Returns 1

=begin
? What if we wanted to sort the books by title, but from Z-A, or descending order?
Ruby's default sort method only works for ascending order.

* Well, the sort method assumes by default that you want to sort in ascending order but it accepts a block as an optional parameter that allows you to specifiy how two items should be compared.
=end

books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]

# To sort our books in ascending order, in-place
puts(books.sort! { |firstBook, secondBook| firstBook <=> secondBook })

# Sort your books in descending order, in-place below

puts(books.sort! { |firstBook, secondBook| secondBook <=> firstBook })

#! Practice:
#? Create a method, welcome, that puts “Welcome to Ruby!” After defining your method, call it.
def welcome
    puts("Welcome to Ruby!")
end
welcome()

#? Change your welcome method definition. Add a single string parameter called name. Remove your puts statement and replace it with return "Hello, #{name}"
def welcome(name)
    return ("Hello, #{name}")
end
welcome("Matt")

#? Add a block after .each that multiplies each item by itself and puts the result to the console:
my_array = [1, 2, 3, 4, 5]
my_array.each do |num|
  puts num * num
end

#? Use .sort! to sort the fruits array in descending alphabetical order. You can use the combined comparison operator or an if / elsif / else statement:
fruits = ["orange", "apple", "banana", "pear", "grapes"]

fruits.sort! do |fruitOne, fruitTwo| 
    fruitTwo <=> fruitOne
end
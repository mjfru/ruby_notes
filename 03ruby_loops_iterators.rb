#! Loops & Iterators in Ruby

#! The While Loop
=begin
? If an occasion arises when we want to repeat an action in Ruby -while- a certain condition is true but the amount of times we need is unknown, we can use a while loop!
For example, asking a user for a specific piece of information.
    - If they repeatedly give you the wrong information, you need to continue asking.
* While loops in Ruby, as in other programming languages, check to see if a condition is true and as soon as it is no longer true, the loop terminates.
=end

counter = 0
while counter < 5
    puts counter
    counter = counter + 1
end

i = 1
while i <= 50 do
    print i
    i += 1
end

#! Important: If we forget to increment the counter, we'll run into an infinite loop because the condition will -always- be less than 5.

#! The Until Loop
=begin
* To me, the Until loop is unique to Ruby and stands as a complement to / a backwards while loop.

i = 0
until i == 5
    i = i + 1
end
puts i

? A variable is created and set to 0.
? The code block is executed until i is equal to 6 and increments by 1 each time.
? When i is equal to 6, the block stops executing and 6, the value of i, is printed.
=end

i = 1
until i == 51 do
    print i
    i += 1
end

#! More Assignment Operators
=begin
* Until now, we've utilized syntax like i = i + 1, which is great and works, but there's another common way in Ruby (and many other languages.)
? Shortcut exist for adding, subtracting, multiplying, dividing, etc.
* We can now write i += 1, i -= 1, i *= 1, i /= 1 and so on.
! Essentially, it's telling Ruby 'add 1 to this variable and assign the new value to it'.
Note: Ruby does NOT use ++ or --.
=end
#? Same as the above example for 'The Until Loop':

i = 0
until i == 5
    i += 1
end
puts i

#! The 'For' Loop - The Big One
=begin
* For (get it?) times you actually DO know how many times you'll be looping through something, you'll want to use a For loop.
=end

#? A simple for loop in Ruby might look something like this:
for num in 1...10
    puts num
end
# This basically says 'For the num in the range 1 to 10, do this: (puts num).'
# (Will print 1 - 9)

#! Inclusive & Exclusive Ranges
=begin
#? The reason the above example will count to 9 and not 10 was because of the 3 dots in the range.
#* '...' tells a Ruby for loop to exclude the final number in the count!
#* '..' tells Ruby to -include- the highest number (10) in the range.
=end

#? Inclusive Example:
for num in 1..10
    puts num
end
# (Will print 1-10)

#! The Loop Method
=begin
Loops are one way to repeat an action, but, as is common in the world of programming and Ruby, there are always more than one way to accomplish something.
* Here, it's possible to repeat an action using an iterator; a Ruby method that repeatedly invokes a block of code.
? The code block is the instructions that will be repeated in our loop.
# The simplest iterator is the loop method.
#! You can create a basic (yet infinite...beware!) loop with just this syntax:
loop { print "Hello World!" }
#* In Ruby, curly braces {} are usually interchangeable with the key words 'do' & 'end'
#* The example below will contain the work 'break' - this ends a loop as soon as a condition is met.
=end
i = 0
loop do
    i += 1
    print "#{i}"
    break if i > 5
end

i = 0
loop do
    i += 1
    print "Ruby!"
    break if i == 30
end

#! Next
=begin
* The 'next' keyword can be used to skip over steps in our loop.
It allows us to filter items that will be run in our loop.
=end

#? For example: if we don't want to print out the even numbers in this loop...:
for i in 1..5   # Loops through 1-5, assigning the numbers to i in each turn
    next if i % 2 == 0  # If true, it skips what is next and goes back to the next iteration.
    print i
end

#! Arrays - To Save Multiple Values
=begin
* If we want to store multiple values in a variable, we can use an Array.
? An array, like in other languages, is a list of items, indicated by square [] brackets.
=end

simple_array = [1, 2, 3, 4]

#! .each Iterator
=begin
* Previously, we learned about the loop iterator and while it's simple, it's also not so powerful.
* A better option might be the .each method, which can apply an expression to each element of an object, one at a time.
? The syntax looks like this:

object.each { |item|
    # Do your thing here!
}

! OR
? The {} can be replaced with the 'do' and 'end' keywords

object.each do |item|
    # Do your thing here!
end

* The variable between the | | can be ANYTHING you want...it's simply a placeholder for each element of whatever you're using .each on.
=end

#? Example from course:
array = [1,2,3,4,5]

array.each do |x|   # x represents each item it will iterate over
    x += 10         # adds 10 to each of the array items, 'x'
    print "#{x}"    # prints 1112131415
end

odds = [1,3,5,7,9]

odds.each do |num|
    print "#{num*2}"
end

#! .times Iterator
=begin
* You can think of the .times iterator as a simple and compact for loop.
? It performs a task on each item in an object a -specified- amount of times.
=end

5.times { print "I'm going to display 5 times!" }
30.times { print "Ruby!" }
#! Blocks, Procs, & Lambdas
=begin
Earlier, it was said that a block is like a nameless method...however that's not entirely true (more on that later!).
* A Ruby block is just a bit of code that can be executed.
* Block syntax uses either do..end or curly braces {} like so:
=end

[1, 2, 3].each do |num|
    puts num
end

[1, 2, 3].each { |num| puts num }

#? Blocks can be combined with methods like .each and .times to execute an instruction for each element in a collection (like a hash or array).

#? Let’s do a little review! Use .times and a block to puts the string “I’m a block!” five times.

5.times do
    puts "I'm a block!"
end

=begin
? There are a bunch of useful methods that take blocks; one that's not covered so far is - collect -.
* Collect takes a block and applies the epxression in the block to every element in an array:
=end

my_nums = [1,2,3]
my_nums.collect { |num| num ** 2 }
# [1,4,9]

=begin
If we look at the value of my_nums, though, we'll see it hasn't changed.
? This is because .collect returns a COPY of my_nums but doesn't change (mutate) the original my_nums array.
* If we want to do that, we use an exclamation points with .collect... .collect!
=end

my_nums = [1,2,3]
my_nums.collect! { |num| num ** 2 }

#! Remember that ! means 'this method could do something dangerous!' in Ruby. Here it mutates the original array.
#? Create a new variable, doubled_fibs, and set it equal to the result of calling fibs.collect. The block you pass to .collect should double each Fibonacci number, similar to the example above.

fibs = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

doubled_fibs = fibs.collect { |num| num * 2 }
puts double_fibs


#! Yields
=begin
Some methods accept a block and others don't because ones that do have a way of transferring control from the calling method to the block and back again.
* We can build this into the methods we define by using the - yield - keyword.
=end

def block_test
    puts "We're in the method!"
    puts "Yielding to the block..."
    yield
    puts "We're back in the method!"
end

block_test { puts ">>> We're in the block!" }

=begin
* You can also pass parameters to yield! Look at this example:
1. The yield_name method is defined with one parameter, name.
2. On line 9, we call the yield_name method and supply the argument "Eric" for the name parameter. Since yield_name has a yield statement, we will also need to supply a block.
3. Inside the method, on line 2, we first puts an introductory statement.
4. Then we yield to the block and pass in "Kim".
5. In the block, n is now equal to "Kim" and we puts out “My name is Kim.”
6. Back in the method, we puts out that we are in between the yields.
7. Then we yield to the block again. This time, we pass in "Eric" which we stored in the name parameter.
8. In the block, n is now equal to "Eric" and we puts out “My name is Eric.”
9. Finally, we puts out a closing statement.
=end

def yield_name(name)
    puts "In the method! Let's yield."
    yield("Kim")
    puts "In between the yields!"
    yield(name)
    puts "Block complete! Back in the method."
end

yield_name("Eric") { |n| puts "My name is #{n}." }

#? Now call the method with your name!
yield_name("Matt") { |n| puts "My name is #{n}." }

#? Define your own method, double, that accepts a single parameter and yields to a block.
#? Then call it with a block that multiplies the number parameter by 2.
def double(num)
    yield(num)
end

double(2) {|x| puts x * 2}

#! Procs
=begin
* You can think of a proc as a “saved” block: just like you can give a bit of code a name and turn it into a method, you can name a block and turn it into a proc.
Procs are easy to define.
You just call Proc.new and pass in the block you want to save.
=end

# Examples:
multiples_of_3 = Proc.new do |n|
    n % 3 == 0
end

print (1..100).to_a.select(&multiples_of_3)

cube = Proc.new { |x| x ** 3 }

#? The .floor method rounds a float (a number with a decimal) down to the nearest integer. 
#? Write a proc called round_down that will do this rounding (we’ve added the code to pass it to floats.collect).

floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]

round_down = Proc.new { |x| x.floor }

ints = floats.collect(&round_down)
print ints

#! Why Procs?
=begin
Why bother saving blocks as procs?
* There are two main reasons:
?   1. Procs are full-fledged objects, so they have all the powers and abilities of objects (whereas blocks do not).
?   2. Unlike blocks, procs can be called over and over without rewriting them.
?       This prevents you from having to retype the contents of your block everytime you need to execute a particular bit of code.
=end

#? Remove the blocks and replace them with a proc called over_4_feet so that the code in the block only needs to be written once.

=begin
Here at the amusement park, you have to be four feet tall or taller to ride the roller coaster. Let's use .select on each group to get only the ones four feet tall or taller.
=end

group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]
group_3 = [5.5, 5.1, 3.9, 4.3, 4.9, 3.2, 3.2]

# Complete this as a new Proc
over_4_feet = Proc.new { |height| height >= 4 }

# Change these three so that they use your new over_4_feet Proc
can_ride_1 = group_1.select(&over_4_feet)
can_ride_2 = group_2.select(&over_4_feet)
can_ride_3 = group_3.select(&over_4_feet)

puts can_ride_1
puts can_ride_2
puts can_ride_3

#? Create a method, greeter, that takes no arguments and yields to a block. Create a Proc, phrase, that puts "Hello there!". Pass this to greeter instead of a block.

def greeter
    yield
end

phrase = Proc.new { puts "Hello there!" }
greeter(&phrase)

=begin
* There's an even easier way to call a proc.
? Unlike blocks, we can call procs directly by using Ruby's .call method like so:
=end

test = Proc.new { }
test.call

hi = Proc.new { puts "Hello!" }
hi.call

#! Symbols & Procs
#? You can also convert symbols to procs using that handy little &:
strings = ["1", "2", "3"]
nums = strings.map(&:to_i)
# ==> [1, 2, 3]

#? By mapping &:to_i over every element of strings, we turned each string into an integer!

#? Using the example in the instructions as a guide, use collect or map to create the strings_array from the numbers_array.
#? Each element of strings_array should be the string version of the corresponding element from the numbers_array 
numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
strings_array = numbers_array.map(&:to_s)

puts strings_array

#! The Ruby Lambda
=begin
Like procs, lambdas are objects.
* With the exception of a bit of syntax and some other quirks, lambdas are identical to procs!
=end

lambda { puts "Hello!" }
#? Is about the same as:
Proc.new { puts "Hello!" }

#* Below, when we pass the lambda to lambda_demo, the method calls the lambda and executes its code:
def lambda_demo(a_lambda)
    puts "I'm the method!"
    a_lambda.call
end

lambda_demo(lambda { puts "I'm the lambda!" })

=begin
* Lambdas are defined using this syntax:
? lambda { |param| block }
? They are useful in the same situations in which you'd use a proc.
=end

#? We have an array of strings in the editor, but we want an array of symbols.
#? Create a new variable called symbolize. In symbolize, store a lambda that takes one parameter and calls .to_sym on that parameter.
#? We then use symbolize with the .collect method to convert the items in strings to symbols!

strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda { |param| param.to_sym }
symbols = strings.collect(&symbolize)
print symbols

=begin
* Just like with procs, we'll need to put & at the beginning of our lambda name when we pass it to the method, since this will convert the lambda into the block the method expects.
=end

#? Create a lambda, symbol_filter, that takes one parameter and checks to see if that parameter .is_a? Symbol.
#? Create a new variable called symbols, and store the result of calling my_array.select and passing it your lambda.
#? puts symbols at the end of the file in order to see the final contents of the array.
my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]
symbol_filter = lambda { |param| param.is_a? Symbol }
symbols = my_array.select(&symbol_filter)

#! Review
=begin
#! #1:
? Create a new variable, ints, and store the result of calling odds_n_ends.select method with a block that checks if the element .is_a? Integer.
? puts ints at the end of the file in order to see the final contents of the array.
=end

odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]
ints = odds_n_ends.select { |i| i.is_a? Integer}
puts ints

=begin
#! #2:
? Create a proc called under_100 that checks if a number it’s passed is less than 100.
(We’ll handle passing this proc the .select method in the next exercise—we won’t need to do anything with the ages array just yet.)
=end

under_100 = Proc.new { |i| i < 100 }

=begin
#! #3:
? Create a variable called youngsters and set it equal to calling .select on ages, and pass in your under_100 proc to filter for the ages that are less than one hundred. 
? Remember to pass &under_100 to convert your proc to a block!
? puts youngsters at the end of the file in order to see the final contents of the array.
=end

ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]

under_100 = Proc.new { |i| i < 100 }
youngsters = ages.select(&under_100)
puts youngsters

=begin
#! #4:
? Create a lambda called first_half that checks if a hash value is less than (that is, earlier in the alphabet than) “M”. 
? (No need to do anything with the crew hash yet.) 
? Make sure to use a capital “M,” since we’ll be checking capitalized names! 
? Because it will be checking a hash, your lambda should include |key, value| instead of just |value|.
=end

crew = {
    captain: "Picard",
    first_officer: "Riker",
    lt_cdr: "Data",
    lt: "Worf",
    ensign: "Ro",
    counselor: "Troi",
    chief_engineer: "LaForge",
    doctor: "Crusher"
}

first_half = lambda { |x,y| y<"M"}

=begin
? To finish up, let’s go ahead and create a variable called a_to_m and set it equal to calling .select on crew, and pass in your first_half lambda to filter for the names that are before “M” in the alphabet. 
? Remember to pass &first_half to convert your lambda to a block!
?puts a_to_m at the end of the file in order to see the final contents of the array.
=end

a_to_m = crew.select(&first_half)
puts a_to_m
#! Ruby Data Structures

#! Arrays

#! Declaring Arrays:
=begin
? Like other programming languages, Ruby uses arrays to hold multiple values.
* Declare a variable as usual, use the [] braces, and put your values inside, seperated by a comma. 
=end

my_first_array = ["Hello", "array", "number", 1]

#! Access By Index
=begin
As we likely already know, each element of an array has an index.
Indices begin at 0, meaning the first element of your array will have an index of 0.
* We can access specific elements of an array directly through using an index within a square [] bracket.
=end

index_example = [21, "Coffee", true, 9]
index_example[2] # Returns true
index_example[0] # Returns 21

#? This is called -access by index-.

#! Arrays of Arrays
=begin
Yes, arrays can hold anything...including other arrays!
? These are called multidimensional arrays, since the act of adding more arrays expands the array out of its string-like shape.

=end

multi_d_array = [[1,2,3,4],[1,2,3,4],[4,3,2,1],[2,4,3,1]]
#! This is a two-dimensional array
multi_d_array.each { |x| puts "#{x}\n" }

#! Hashes
=begin
* While arrays use numeric indices (starting at 0), there are many instances when we don't want them. 
* We can then use a data structure called a -hash-.
? Hashes are like JavaScript objects, Python dictionaries, or...Java hashes!
! Hashes are collections of key-value pairs in Ruby.
Below is the syntax:
=end

#? Method #1 of creating a new hash, literal notation:
hash = {
    key1 => value1,
    key2 => value2,
    key3 => value3
}

#! Hashes Continued
#! Using Hash.new
=begin
? Method #2 of creating a new hash, utilizing Hash.new
Setting a variable equal to Hash.new creates a new, empty hash, the same as setting the variable to empty curly braces.
=end

example_hash = Hash.new
#* Hash must be capitalized

#! Adding to a a Hash
=begin
* There are two ways to add to a hash:
?   If we used literal notation, we can simply add a new key-value pair directly between the curly {} braces.
?   If we used Hash.new, we can add to the hash using bracket [] notation.
=end

#? (Method #2)
pets = Hash.new
pets["Gracie"] = "dog"

#! Accessing Hash Values
=begin
? You can access values in a hash just like an array (using bracket notation).
=end

games = {
    "Final Fantasy" => "RPG",
    "Goldeneye" => "FPS",
    "F-Zero 64" => "Racer"
}

puts games["Final Fantasy"] # Prints "RPG"

#! Iterating Over Arrays
=begin
* Iterating over arrays is simple: you use the .each method with the array, use a placeholder to represent an individual element in that array, and instructions.
=end

numbers = [5, 4, 3, 2, 1]
numbers.each { |number|
puts number}

languages = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
languages.each { |language|
puts language}

#! Iterating Over Multidimensional Arrays
sandwiches = [["ham", "swiss"], ["turkey", "pepper jack"], ["roast beef", "cheddar"]]
=begin
? Here we have a multidimensional array but we don't want to just iterate over each main element (["meat", "cheese"]). We want to get all the meats and cheeses within sandwiches.
* If we wanted to access just "swiss" in the first subarray, we could type: sandwiches[0][1]
? [0] indicates the first element, [1] indicates the second element in the indicated array.

* Now, to get all the ingredients, the meats and cheeses, to be printed individually to the console, we could do something like this:
=end

sandwiches.each { |sub_array| sub_array.each { |ingredient| puts ingredient }}
#? array.each   iterate over each sub-array,    iterate over each element in sub-array

my_array = [["Japanese, Korean"], ["Swedish, Norwegian"]]

#! Iterating Over Hashes
=begin
When iterating over hashes, we need two placeholder variables to represent each key/value pair.
Check out this example:
=end

restaurant_menu = {
    "noodle" => 5,
    "soup" => 3,
    "salad" => 2
}

restaurant_menu.each do |item, price|
    puts "#{item}: #{price}"
end

=begin
*   1. First, we created a new hash called restaurant_menu
*   2. Second, we loop through it and assign the KEY to 'item' and the VALUE to 'price' for each iteration.
*   3. Finally, we use puts to display each iteration's information to the console.
? The output will look like this now:
noodle: 5
soup: 3
salad: 2
=end

secret_identities = {
    "The Batman" => "Bruce Wayne",
    "Superman" => "Clark Kent",
    "Wonder Woman" => "Diana Prince",
    "Freakazoid" => "Dexter Douglas"
}

secret_identities.each do |hero, identity|
    puts "#{hero}: #{identity}"
end

# We don't have to print or use everything even if we iterate over it.
#? Here's how to get and use the value while ignoring the key:
lunch_order = {
    "Ryan" => "wonton soup",
    "Eric" => "hamburger",
    "Jimmy" => "sandwich",
    "Sasha" => "salad",
    "Cole" => "taco"
}

lunch_order.each { |person, item| 
puts "#{item}" }
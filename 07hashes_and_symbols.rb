#! Hashes and Symbols
#? Review:
=begin
* Recall that hashes are collections of key-value pairs, where a unique key is associated with some value.
For example:
=end

breakfast = {
    "bacon" => "tasty",
    "eggs" => "tasty",
    "oatmeal" => "healthy",
    "OJ" => "juicy"
}

=begin
Remember that keys MUST be unique, but values can repeat.
That's why we can have more than one key share the value "tasty".

We can create hashes several ways, but two of the most popular are:

!   1. hash literal notation
?       new_hash = {"one" => 1 }

!   2. hash constructor notation
?       new_hash = Hash.new
=end

#! Iterating Over Hashes
=begin
* We can also iterate over hashes using the .each method.
For example, we could do:
=end

my_hash.each do |key, value|
    puts my_hash[key]
end

# This will print out a list of values from my_hash, each on its own line.

matz = { "First name" => "Yukihiro",
    "Last name" => "Matsumoto",
    "Age" => 47,
    "Nationality" => "Japanese",
    "Nickname" => "Matz"
}

matz.each do |key, value|
    puts matz[key]
end

#! Introduction to 'Nil'
=begin
? What happens if you try to access a key that doesn't exist?
* In many languages, you'll get an error of some kind; not so in Ruby!
* You'll get the special value 'nil'.

* Along with false, nil is one of the two non-true values in Ruby.
(Every other object is regarded as "truthy", meaning that if you were to type 'if 2' or 'if "bacon"', the code in that if statement would run.)
* It's important to understand that false and nil are NOT the same thing:
!   - False means "not true"
!   - Nil means "nothing at all"
=end

#! Setting Your Own Default
=begin
You don't have to settle for 'nil' as a default value.
* If you create your hash using the Hash.new syntax, you can specify a default like so:
=end

my_hash = Hash.new("Trady Blix")

=begin
Now, if you try to access a nonexistent key in my_hash, you'll get "Trady Blix" as a result.
=end

#! Symbols - A Key of a Different Color
=begin
We can certainly use strings as Ruby hash keys; as we've seen, there's always more than one way to do something in Ruby.
The 'Rubyist's' approach here would be to use symbols, seen below:
=end

menagerie = { :foxes => 2,
    :giraffe => 1,
    :weezards => 17,
    :elves => 1,
    :canaries => 4,
    :ham => 1
}

=begin 
? So, what exactly is a symbol?
* Symbols always start with a colon ( : ).
They must be valid Ruby variable names, so the first character after the colon has to be a letter or underscore ( _ ); after that, any combination of letters, numbers, and underscores is allowed!.
! Make sure you don't put any spaces in your symbol name-- if you do, Ruby will get confused!
=end

:my symbol # Don't do this.
:my_symbol # Do this!!

my_first_symbol = :symbol

=begin
? What are Symbols used for?
Symbol can pop up in a lot of places in Ruby.
* However, they're primarily used ether as hash keys or for referencing method names.
Symbols make good hash keys for a few reasons:
*   1. They're immutable; they can't be changed once created
*   2. Only one copy of any symbol can exist at a given time; therefore memory efficient
*   3. Symbol-as-keys are faster than strings-as keys because of the two above reasons.
=end

symbol_hash = {
    :one => 1,
    :fruit => "apple",
    :language => "Ruby"
}

#! Converting Between Symbols & Strings
=begin
Luckily for us, converting between strings and symbols is a snap in Ruby!
* The .to_s and .to_sym methods are what you're looking for!
=end

:sasquatch.to_s
# ==> "sasquatch"

"sasquatch".to_sym
# ==> :sasquatch

=begin
We have an array of strings we’d like to later use as hash keys, but we’d rather they be symbols.
    1. Create a new variable, symbols, and store an empty array in it.
    2. Use .each to iterate over the strings array.
    3. For each s in strings, use .to_sym to convert s to a symbol and use .push to add that new symbol to symbols.
    4. Print the symbols array.
=end

strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
symbols = []

strings.each do |s| 
    symbols.push(s.to_sym)
end 
print symbols

=begin
Remember, there are many ways to accomplish things in Ruby.
Converting strings to symbols is no different!
* Besides using .to_sym, we can also use .intern.
? This will - internalize - the string into a symbol and works just like - .to_sym -.
=end

"hello".intern
# ==> :hello

strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
symbols = []

strings.each {
    |s|
    symbols.push(s.intern)
}

print symbols

#! ...The...Hash Rocket?!
=begin
? The hash syntax you've seen so far (with the => symbol between keys and values) is sometimes nicknamed the hash rocket style.
* This is because the => looks like a tiny rocket!
Let's build a hash from the ground up using symbols as keys:
=end

numbers = {
    :one => 1,
    :two => "two",
    :three => 3
}

movies = {
    :gladiator => "Modern classic",
    :inception => "Wildly overrated"
}

#! The Hash has Changed!
=begin
? In Ruby 1.9, a new way to make a hash was introduced, making it easier to type and more akin to JavaScript objects or Python dictionaries.
* The two changes are:
    1. You put the colon at the end of the symbol, not at the beginning,
    2. You don't need the hash rocket anymore (sadge).

It's important to note that even though these keys have colons at the end instead of the beginning, they're still symbols!
=end

new_hash = {
    one: 1,
    two: 2,
    three: 3
}

# Update the hash from the last exercise to use the 1.9 syntax:
movies = {
    gladiator: "Modern classic",
    inception: "Wildly overrated"
}

#! Becoming More Selective
=begin
We know how to grab a specific value from a hash by specifying the associated key, but what if we want to filter a hash for values that meet a certain criteria?
* For that, we can use .select
=end

grades = {
    bob: 92,
    chris: 95,
    dave: 97
}

grades.select {
    |name, grade|
    grade < 97
}
# ==> { :bob => 92, :chris => 95 }

grades.select {
    |k, v|
    k == :alice
}
# ==> { :alive => 100 }

=begin
? In the example above, we first create a hash that maps symbols to integers.
Then, we call the .select method and pass in a block of code.
* The block contains an expression for selecting matching key/value pairs.
* It returns a hash containing :bob and :chris.
Finally, we call the .select method again.
* Our block looks only for the key :alice.
? This is an inefficient method of getting a key/value pair, but it does show that .select does not modify the hash!

(Here we're using "name" or "k" to stand for the key and "grade" or "v" to stand for the value, but you can call them whatever you like!)
=end

#? Create a new variable, good_movies, and set it equal to the result of calling .select on movie_ratings, selecting only movies with a rating strictly greater than 3.

movie_ratings = {
    memento: 3,
    primer: 3.5,
    the_matrix: 5,
    truman_show: 4,
    red_dawn: 1.5,
    skyfall: 4,
    alex_cross: 2,
    uhf: 1,
    lion_king: 3.5
}

good_movies = movie_ratings.select {
    |movie, rating|
    rating > 3
}

puts good_movies


#! More Methods, More Solutions
=begin
We've often found we only want the key or value associated with a key/value pair, and it's kind of a pain to put into our block and only work with one.
? Can we iterate over just keys or just values?
! This is Ruby! Of course we can!

* Ruby includes two hash methods: .each_key and .each_value, which do exactly what you might expect.
Let's test these out!
=end

my_hash = { one: 1, two: 2, three: 3 }
my_hash.each_key { |k| print k, " " }
# ==> one two three

my_hash.each_value { |v| print v, " " }
# ==> 1 2 3

#? Go ahead and print out just the titles of our movies using puts:
puts movie_ratings.each_key {
    |k| puts k
}
#! OOP in Ruby
=begin
* Almost everything in Ruby is an object and we've been using them and their benefits all along.
* Objects of course have methods and attributes.
In the example below, the "Matz" object is a string with a .length method and a length attribute of 4.
? What makes 'Matz' a string? - The fact that it's an instance of the String class!
* A class is just a way of organizing and producing objects with similar attributes and methods. 
=end

"Matz".length # 4

class Language
    def initialize(name, creator)
        @name = name
        @creator = creator
    end

    def description
        puts "I'm #{@name} and I was created by #{@creator}!"
    end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

ruby.description
python.description
javascript.description

#! Class Syntax
=begin
* A basic class consists only of the class keyword and the name of the class, as seen below:
? Our NewClass has the ability to create new Ruby objects of class NewClass (just like 'Hello!' is a String and 4 is a fixnum).
* By convention, class names start with a capital letter and use CamelCase instead of relying_on_underscores.
=end

class NewClass
    # Magic Here
end

class Person

end

#! Initialize
#* The key word 'initialize' boots up each object the class creates!

class Person
    def initialize
    end
end

#! @name
=begin
* One more thing we need before we can create a person from this class: a @name!
* In Ruby, @ is used before a variable to signify that it's an - instance variable -.
? This means that the variable is attached to the instance of the class.
=end

class Car
    def initialize(make, model)
        @make = make
        @model = model
    end
end

kitt = Car.new("Pontiac", "Trans Am")

#? The example above creates an instance, kitt, of the class Car.
#? kitt has his own @make ('Pontiac') and @model ('Trans Am').
#* Those variables belong to the kitt instance, which is why they're called instance variables!

class Person
    def initialize(name)
        @name = name
    end
end

#! Instantiating An Object
#* We can create an instance of a class just by calling .new on the class name, like so:
me = Person.new("Matt")

#? Create a variable, matz, and set it equal to calling .new on your Person class. Pass .new the name “Yukihiro” as its only argument.

matz = Person.new("Yukihiro")

#! Naming Variables
=begin
* Recall that instance variables begin with an @. This isn't just a Ruby convention, it's part of the syntax!
* Class variables are like instance variables, but instead of belonging to an instance of a class, they belong to the class itself.
! Class variables always start with two '@@', like @@flies.
* Global variables can be declared in two ways.
? The first is one you're already familiar with: you just define a variable outside of any method or class and voila.
? If you want to make a variable global from inside a method or class, just start it with '$'...like $matz.
=end

#? The variable my_variable is inside a class, so it’s not reachable by the puts method outside it. But you can fix this! Use either of the two global variable tricks mentioned above.

class MyClass
    $my_variable = "Hello!"
end

puts $my_variable


#! A caveat to this is that global variables can be changed anywhere in your program, and they are generally not a very good idea.
#* It's much better to create variables with limited scope that can only be changed from a few places!
#? For example, instance variables belong to a particular object (or 'instance').

#? Add age and profession parameters to the initialize method, then set these equal to instance variables in the body of the method. Use the name/@name example as a guide.

class Person
    def initialize(name, age, profession)
        @name = name
        @age = age
        @profession = profession
    end
end


#! Twice the @, Twice as Classy
=begin
* We can create class variables by starting a variable name with two @@ symbols.
Class variables are attached to entire classes, not just instances of classes...like so:
? class MyClass
?   @@class_variable
? end

Because there's only one copy of a class variable shared by all instances of a class, we can use them to pull off some cool Ruby tricks.
For example, we can use a class variable to keep track of the number of instances that class we've created.
=end

#? Let's do 3 Things:
#? 1. Create a class variable, @@people_count, on line 3, and set it equal to 0.
#? 2. Increment @@people_count
#? 3. Return @@people_count so that our puts will print out the number of people created so far.

class Person
    # Set your class variable to 0
    @@people_count = 0
    
    def initialize(name)
        @name = name
        # Increment your class variable
        @@people_count += 1
    end
    
    def self.number_of_instances
        # Return your class variable on line 13
        return @@people_count
    end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")
puts "Number of Person instances: #{Person.number_of_instances}"
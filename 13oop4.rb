#! OOP - Part 4

#! Modules
=begin
* You can think of a module as a toolbox that contains a set of methods and constants.
There are LOTS of Ruby tools you might want to use but it would clutter the interpreter to keep them around all the time.
* We'll only pull in the modules we want to use...as we want to use them.
? You can think of modules as being similar to classes but they can't create instances and can't have subclasses.
* They're just used to store things.

* Like class names, module names are written in CapitalizedCamelCase.

=end

#? 1. Create your own module called MyLibrary in the editor to the right. Include a constant called FAVE_BOOK and set it equal to a string naming your favorite book!
module MyLibrary
    FAVE_BOOK = '1Q84'
end

=begin
* One of the main purposes of modules is to seperate methods and constants into named spaces.
? This is called namespacing, and it's how Ruby doesn't confuse Math::PI and Circle::PI.

* That double colon icon that was just used is called the scope resolution operator, which is a fancy way of saying it tells Ruby where you're looking for a specific bit of code.
In Math::PI, Ruby knows to look inside the Math module to get that PI, not any other PI.
Let's get some practice in with an existing Ruby module, Math.
=end

#? 1. Use the scope resolution operator to puts the value of PI from the Math module to the console.
puts Math::PI


=begin
* Some modules, like Math, are already present in the interpreter
* Others need to be explicitly brought in and we can do this by using 'require':
?   require "module_name"
=end

#? 1. We want to use the Ruby Date module to show today’s date, but we haven’t required it yet! Go ahead and require 'date' on line 1 so the code on line 3 will work:

require "date"

puts Date.today

=begin
! Include
We can do more than just require a module, however.
* We can also include it!
* Any class that includes a certain module can use those module's methods.
? A nice effect of this is that you no longer have to prepend your constants and methods with the module name.
Since everything has been pulled in, you can simply write PI instead of Math::PI.
=end

#? 1. In our case, we want to use Math::cos but we don’t want to type Math::; please include Math on line 2.

class Angle
include Math
    attr_accessor :radians
    
    def initialize(radians)
        @radians = radians
    end
    
    def cosine
        cos(@radians)
    end
end

acute = Angle.new(1)
acute.cosine

=begin
! The Marriage of Modules & Classes
We just mixed together the behavior of a class and a module!
* When a module is used to mix additional behavior and information into a class, it's called a mixin.
? Mixins allow us to customize a class without having to rewrite code.

* Now you understand why we said mixins could give us the ability to mimic inheriting from more than one class: by mixing traits from various modules as needed, we can add any combination of behaviors to our classes as we like!
=end

#? 1. Create a module, MartialArts.
#? 2. Inside, define a method called swordsman that just puts "I'm a swordsman."
#? 3. On the first line inside Ninja and the first line inside Samurai, include MartialArts to mix this into both the Ninja and Samurai classes, thereby giving them the swordsman method.

# Create your module here!



module MartialArts

    def swordsman
        puts "I'm a swordsman."
    end
end

class Ninja
include MartialArts
def initialize(clan)
    @clan = clan
    end
end

class Samurai
include MartialArts
def initialize(shogun)
        @shogun = shogun
    end
end

=begin
* Whereas include mixes a module's methods in at the instance level, the - extend - keyword mixes a module's methods at the - class - level.
? This means that class itself can use the methods, as opposed to the instances of the class.
=end

#? 1. We’ve set up an Application class in the editor. 
#? Add a public method called print_status to Application that puts "All systems go!". 
#? Don’t forget to use the public keyword!

class Application
    attr_accessor :status
    def initialize; end
    # Add your method here!
    public
    def print_status
        puts "All systems go!"
    end
    private
    def password
        return 12345
    end
end

#? 2. Below your public method, add a private method called password that returns the super secret password 12345.

#! Module Magic
#? 1. Create your own module called Languages in the editor. 
#? Include a constant called FAVE and set it equal to a string naming your favorite programming language!

module Languages
    FAVE = "JavaScript"
end

#? 2. Finally, let’s include our Languages module in the Master class (on line 6) so that our favorite language gets printed to the console.


class Master
include Languages
    def initialize; end
    def victory
        puts FAVE
    end
end

total = Master.new
total.victory
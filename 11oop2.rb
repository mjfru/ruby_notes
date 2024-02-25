#! OOP Part 2

#! Inheritance
=begin
Inheritance is really tricky so let's go through it step-by-step.
* Inheritance is the process by which one class takes on the attribute and methods of another, and it's used to express an is-a relationship.
? For example, a cartoon fox -is- a cartoon mammal, so a CartoonFox class could inherit from a CartoonMammal class.
? However, a Wizard is not an Elf, so it shouldn't inherit from the Elf class (even if they have some things in common).
Instead, both the Wizard and Elf could ultimately inherit from the same MagicalBeing class.
Check out the example below:
We’ve defined a class, ApplicationError, as well as a SuperBadError class that inherits from ApplicationError.
Note that we don’t define the display_error method in the body of SuperBadError, but it will still have access to that method via inheritance.
=end

class ApplicationError
    def display_error
        puts "Error! Error!"
    end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error

#! Inheritance Syntax
=begin
* In Ruby, inheritance works like this:
class DerivedClass < BaseClass
    # Stuff!
end
? The derived class is the new class you're making and the base class is the class from which that new class inherits.
* You can read '<' as 'inherits from'.

? Create your own class, MyApp, that inherits from Application. No need to put anything inside your class definition just yet!
=end

class Application
    def initialize(name)
        @name = name
    end
end

class MyApp < Application

end

#! Override
=begin
? Sometimes you'll want one class that inherits from another to not only take on methods and attributes of its parent, but to override one or more of them.
For instance, you might have an Email class that inherits from Message.
Both classes might have a send method that sends them, but the e-mail version may have to identify valid e-mail addresses and use a bunch of e-mail protocols that Message knows nothing about.
* Rather than add a send_email method to your derived class and inherit a send method you'll never use, you can instead just explicitly create a send method in the Email class and have it do all the email-sending work.

* This new version of send will override that (replace), inherited version for any object that is an instance of Email.
=end

class Creature
    def initialize(name)
        @name = name
    end

    def fight
        return "Punch to the chops!"
    end
end

class Dragon < Creature
    def fight
        return "Breathes fire!"
    end
end

#! Super
=begin
* Sometimes you'll be working with a derived class (or subclass, if you like) and realize that you've overwritten a method or attribute defined in that class' base class (also called a parent or superclass) that you actually need.
* Don't worry; you can directly access the attributes or methods of a superclass with Ruby's built-in - super - keyword.
=end

class DerivedClass < Base
    def some_method
        super(optional, args)
        # Other stuff
    end
end

=begin
? When you call super from inside a method, that tells Ruby to look in the superclass of the current class and find a method with the same name as the one from which super is called.
* If it finds it, Ruby will use the superclass' version of the method.
=end

#? We decided we want to do some chops-punching after all! Let’s do two things:
#?  1. Add puts "Instead of breathing fire..." as the first line in our Dragon‘s fight method.
#?  2. Replace the return statement inside Dragon‘s definition of fight with the keyword super. (No need to pass any arguments to super, since Creature‘s fight method doesn’t take any.)

class Dragon < Creature
    def fight
        puts "Instead of breathing fire..."
        super()
    end
end


#! Review
#? 1. Create a class called Message and give it an initialize method. The initialize method should take two parameters, from and to, and set them to the instance variables @from and @to (respectively). Don’t worry about creating an instance of your class just yet.

#? 2. Give your Message class a @@messages_sent class variable and set it equal to 0. In the body of your initialize method, increment this value by 1 so that each time a new Message object is created, @@messages_sent will increase by 1. Don’t create any instances of your class just yet!


#? 3. After your class, create a variable called my_message. Create an instance of your Message class using Message.new with whatever from and to arguments you want! Store the result in my_message.

#? 4. Create a second class, Email, that inherits from Message. Give it its own initialize method that takes just one parameter, subject, and has one instance variable, @subject, set equal to subject.

#? 5. To finish this lesson, go ahead and remove the subject parameter and @subject instance variable from Email. Pass Email‘s initialize method the same two parameters passed to Message‘s—from and to—and add the super keyword as the only line of code in the body of Email‘s initialize method.

class Message
    @@messages_sent
    def initialize(from, to)
        @from = from
        @to = to
        @@messages_sent += 1
    end
end

my_message = Message.new("Tom", "Dean")

# class Email < Message
#     def initialize(subject)
#         @subject = subject
#     end
# end

class Email < Message
    def initialize(from, to)
        super
    end
end
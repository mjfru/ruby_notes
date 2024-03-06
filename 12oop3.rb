#! OOP III
=begin
! Like Java, Ruby allows you to make some methods public and others private.
? Public methods allow for an interface with the rest of the program and are accessible elsewhere.
? Private methods are for your classes to do their own work undisturbed and are unreachable.

* Let's review and begin building a class:
    1. First we tell Ruby that we want to construct our class ClassName. Don’t forget the end to end your class!
    2. Inside our ClassName is where we define our methods. Here we have method_name followed by (parameter), When we use this method it will look like this method_name("hello!")
    3. If our parameter above were “Hello!” it would be assigned to our variable @class_variable on the following line.
=end

#? 1. First, create a class named Dog.

class Dog
    def initialize(name, breed)
        @name = name
        @breed = breed
    end
    public
    def bark
        puts "Woof!"
    end
    private
    def id
        @id_number = 12345
    end
end

#! Going Public
=begin
* Methods are public by default in Ruby, so if you don't specify public or private, your methods will be public!
In this case, we want to make it clear to people reading our code which methods are public.
We do this by putting 'public' before our method definitions.
=end

#? 2. Let's add a public method called bark to Dog. The bark method should puts 'Woof!'.

#! Private - Keep Out!
=begin 
* Just as we use public to announce our public methods, we use private to specify our private ones.
? Private methods are just that: they’re private to the object where they are defined.
* This means you can only call these methods from other code inside the object.
? Another way to say this is that the method cannot be called with an explicit receiver.You’ve been using receivers all along—these are the objects on which methods are called! 
? Whenever you call object.method, object is the receiver of the method.

In order to access private information, we have to create public methods that know how to get it.
=end

#? 3. Add a private method called id to Dog. The id method should create an @id_number instance variable and set it equal to 12345.

#! attr_reader, attr_writer, attr_accessor
=begin
* We know that Ruby needs methods in order to access attributes...for example, if we want to access a @name instance variable, we have to write:
def name
    @name
end
* Well, no longer! Because we have attr_reader to access a variable and attr_writer to change it.
class Person
    attr_reader: name
    attr_writer: name
    def initialize(name)
        @name = name
    end
end
? Like magic, we can read and write variables as we please; we just pass our instance variables (as symbols) topo attr_reader or attr_writer.
=end

#? 4. Go ahead and remove the name and job= methods and add an attr_reader for :name and an attr_writer for :job.

class Person
    def initialize(name, job)
        @name = name
        @job = job
    end
    attr_reader:name
    attr_writer:job
end


#* If we want to both read and write a particular variable, there’s an even shorter shortcut than using attr_reader and attr_writer.
#! We can use attr_accessor to make a variable readable and writeable in one fell swoop.


#? 5. Here we have an attr_reader and an attr_writer for :job. Go ahead and replace these with an attr_accessor!

class Person
    attr_reader :name
    attr_accessor :job
    
    def initialize(name, job)
        @name = name
        @job = job
    end
end
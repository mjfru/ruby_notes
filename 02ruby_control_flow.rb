#! Ruby - Control Flow

#! If Statements
#! If
=begin
* Ruby's 'if' statement takes an expression, which will always evaluate that expression to either true or false (a boolean value).
Ruby will execute the code block that follows the 'if' statement ONLY if the expression equates to true.
If it's false, it moves to the next piece of code.
=end

if 100 > 10
    print "I'm getting printed to the console because the left number is greater than the right!"
end

=begin
* It's important to note that an if statement must include the 'end' statement at the conclusion of all your checks.
? Although indentation is not required, it has become common convention in the Ruby community to include two spaces / a tab in your code block.
=end

#! Else
=begin
* A partner to 'if' statements in almost every programming language, 'else', is used to tell the program what to do if the statement after the 'if' section equates to false.
'If' that is false, do this!
Here's an example:
=end

if 10 > 20
    print "This won't get printed because the statement is false!"
else
    print "This will be printed because the statements above are false."
end

#! Elsif
=begin
* Yes, the syntax looks a little funky here, but it's the same 'elseif / else if' we all know.
This is used is we have two or more options that we want to check before defaulting to the 'else' code block.
=end

if 1 > 2
    puts "The left number is bigger!"
elsif 1 < 2
    puts "The right number is bigger!"
else
    puts "They must be equal."

#! Unless
=begin
* Essentially the opposite of 'if', 'unless' checks to see if something is -false-, rather than true.
Think of this as a reverse if / else statement!
=end

bored = false
unless bored
    puts "Keep on going!."
else
    puts "Time to take a break."
end

#! Equality (or not!) and the Equal (=) Sign
=begin
* To begin and to be clear, the '=' is used only for variable assignment in Ruby.
! Do not use it to check anything, only to assign a value to a variable.
* '==' is a comparator / relationship operator that means 'is equal to'.
* Conversely, '!=' is used to check if something is NOT equal to something else.
=end

true_statement = 3 != 4
false_statement = 3 == 10

#! Less Than, Greater Than, -or- Equal To
=begin
Like other programming languages, we can easily check if a value is less than, less than or equal to, greater than, or greater than or equal to.
* Those operators look like this:
    Less than: <
    Less than or equal to: <=
    Greater than: >
    Greater than or equal to: >=
=end

example_1 = 17 > 2
# true
example_2 20 >= 20
# true
example_3 = 10 >= 10
# true
example_4 = 10 <= 10
# true

#! And
=begin
* Ruby also has 3 logical / boolean operators; 'and', written as '&&' in Ruby, is one of them.
* && will only result in true if both expressions on either side of the statement are true.
=end

test_1 = 77 == 77 && 2 + 2 == 4
# true
test_2 = 1 != 1 && 1 == 1
# false

#! Or
=begin
* Of course, Ruby also has the 'or' operator that is written like this: ||
? This is called an inclusive 'or' because it evaluates to true when one, the other, or both expressions are true.
=end

or_example_1 = 3 * 3 != 3 * 2 || true
# true

or_example_2 = false || 2 > 1
# false

or_example_3 = true || 0 == 0
# true

#! Not
=begin
* Ruby also has the boolean operator 'not', written with an exclamation mark (!).
This simply reverse its boolean value.
=end

!true # false
!false # true

#! Boolean Operator Combinations
#* By using parenthesis, you can control the order of operations and string together multiple logic checks.

bool_1 = (1 < 3 || false ) && (false || true)
# 3 is greater than 1, left side is true. True is a value on the right, so also true.
# The entire statement equates to true.

bool_2 = !true && (!true || 100 != 5**2)
# This is automatically false because !true equates to false and it has a &&, meaning both statements msut be true.
# The entire statement is false.
=begin



*** (Understand the) Problem: ***



Essential to understanding how to solve a problem.  In order to be able to solve a problem, you have

to at least understand what the problem is and what it is asking.  Take some time to allow the problem

to load into your brain.  Don't rush this.



First identify the inputs and the outputs of the problem



input:

player choice
computer choice


output:

winner message
scoreboard update



_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

Check for Problem Domain: The Problem Domain is the area of expertise or application that needs to be 

examined to solve a problem.  Basically any domain-specific terms or concepts that may be applicable.

It limits the scope of the problem.



For example, if the problem asks you to add up a set of multiples, you need to make sure you know what

multiples are.  Could one word have multiple meanings? etc



Problem Domain:

Scissors cuts Puper
Paper covers Rock
Rock crushes Lizard
Lizard poisons Spock
Spock smashes Scissors
Scissors decapitates Lizard
Lizard eats Paper
Paper disproves Spock
Spock vaporizes Rock
Rock crushes Scissors

winner gets 1 point
first to 5 points wins the match


_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

Check for Implicit Requirements.  Are there requirements that are not explicitly stated?



Implicit Requirements: 

if two players pick the same choice it is a tie

need to repeat the game several times to get a grand winner

need to enable players to select a choice with one or two letters

need to clear choices between rounds

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

Clarifying Questions:  Some questions to ask the interviewer (or perhaps yourself) to better 

understand the problem.



1. Do i need to customize the message for each win condition?



2. Is there a user name?



3. can you repeat playing a match after you have played one?


_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

Mental Model:  A mental model is an explanation of someone's thought process about how something 

works in the real world.  Think of it as a summary of the "entire problem" written in your own words.

It is your perspective of *what* the problem requires--not *how*.  How is implemented in the Algorithm

section.  



As a rule of thumb, you can keep the number of mental models to one if it fully, and accurately,

captures the requirements of the problem.



Your Mental Model:

player picks one choice
computer picks one choice
compare players choice to computers
display message stating who won
update the scoreboard
clear player and computer choices
when one player gets 5 points declare overall winner


===================================================================================================

*** Examples / Test Cases / Edge Cases: ***



Examples: 

THE OBJECTIVE IS to come up with examples that validate your understanding of the problem, and confirm

that you are working in the right direction.  Typically the confirmation will come from documentation of 

a process, or a person.



Your Examples:

 player picks lizard, computer picks spock. player wins
 player picks scissors, computer picks rock. computer wins
 player picks rock, computer picks rock. tie
 

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _



Test Cases:

Note: Rules for a specific problem are oftentimes an excellent place to find test cases.  If you're 

working with collections, it's a good idea to find test cases that deal with zero, one or multiple

elements in the collection.  



Try to provide test cases that handle any edge cases you can find.

If you're working with collections, it's a good idea to find test cases that deal with zero, one or

multiple elements in the collection.



Your Test Cases:

player picks each choice vs computer picking each choice


_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _



Edge Cases:

Edge cases are situations that occur along the "edge" of a specific problem.  For example: problems that 

involve iterating over numbers have edge cases that are at both ends of the range.  Typically can 

involve working with negative numbers, 0, or extremely high values.



Your Edge Cases:

player enters too many letters for choice

player enters no letters for choice

player enters numbers for choice

player enters letters which are not valid for choice

player enters something other than y or n when asked to play again


===================================================================================================

*** Data Structure:***



Next determine what data structures you will work with to convert the input to the desired output.



THE CHIEF CONSIDERATIONS HERE are your intended programming language and your mental model.



Are you going to use arrays, hashes, etc?



Your data structure will influence your program.

valid choices is a hash constant - keys will be the 5 choices, values will be what those choices beat.

messages will be a yaml file

player choice will be a string

computer choice will be a string

player score will be an integer

computer score will be an integer


===================================================================================================

*** Algorithm: ***



Start with your mental model if you have one.  While you're still learning to solve problems,

it would be a good idea to consistently create mental models to assist you.



Otherwise you can start with your Data Structure, and think about how you'd build and manipulate

it to get to the output.  For example, if you're going to use an array maybe you would want to focus

on constructing or iterating over a collection.



** THE CHIEF OBJECTIVE HERE is to determine a series of instructions that will transform the input

into the desired output.

    - The challenege is to get to the right amount of detail (think about the steps to creating a

    peanut butter and jelly sandwich.)

    - You want something that you can readily convert to code without actually writing code.

    - Before implementing the algorithm, you should test it manually with test cases.  

require yaml
set message constant

set valid choices array constant

initialize player choice hash
initialize computer choice hash

initialize player score variable
initialize computer score variable

define message method

define prompt method

define display greeting method

define display instructions method

define display choose one method

define display choice error method

define display choices method - arguments player choice, computer choice

define display score method - arguments player score, computer score

define display choice relationship method - arguments choice1, choice2, winner

define display tie game method - arguments player choice, computer choice

define display you win round method - arguments player choice, computer choice
  call display choice relationship method - arguments player choice, computer choice

define display computer win round method - arguments computer choice, player choice
  call display choice relationship method - arguments computer choice, player choice

define display you win match method

define display computer win match method

define increment score method - argument player or computer
  increment score of round winner by 1

define check match score method - argument player score, computer score

define get player choice method
  player choice loop
    offer player choice
    get player choice
    check for valid choice entry
      if valid choice
        return the choice
      else
        display choice error message
        restart player choice loop

define get computer choice method
  returns computer choice

define check for tie method - arguments player choice, computer choice
  check to see if choices are equal

define check for win method - arguments player1, player2
  check to see if player2 choice is value of player1 key in valid choices
  
define compare choices method - arguments player choice, computer choice

define clear choices method - arguments player choice, computer choice
   call check for tie method
      if true
        return tie
    call check for win player 
      if true
        return player
      else
        return computer

define play again method
  play again loop
    ask to play again
      if yes
        exit loop
      else if no 
        exit program
      else
        restart loop


clear screen
greet player

main loop starts here
  call display instructions method
  call get player choice method
  call get computer choice method
  compare choices
  call display winner
  call increment score method argument for winner
  call check match score method
  call display score method
  call play again method
  call clear choices method
  clear screen
  restart loop

good bye message




















=end





# Code:
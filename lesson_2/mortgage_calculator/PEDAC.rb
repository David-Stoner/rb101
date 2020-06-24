=begin



*** (Understand the) Problem: ***



Essential to understanding how to solve a problem.  In order to be able to solve a problem, you have

to at least understand what the problem is and what it is asking.  Take some time to allow the problem

to load into your brain.  Don't rush this.



First identify the inputs and the outputs of the problem



input:

      loan amount
      annual percentage rate
      the loan duration

output:

      monthly interest rate
      loan duration in months
      monthly payment



_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

Check for Problem Domain: The Problem Domain is the area of expertise or application that needs to be 

examined to solve a problem.  Basically any domain-specific terms or concepts that may be applicable.

It limits the scope of the problem.



For example, if the problem asks you to add up a set of multiples, you need to make sure you know what

multiples are.  Could one word have multiple meanings? etc



Problem Domain:

              loan amount            - the number of dollars taken out as initial principle
              annual percentage rate - the amount that the principle increases every year
              loan duration          - the time over which payments will be made
              
              monthly interest rate  - the amount the principle increases each month - APR / 12
              loan duration in months- number of monthly payments to be made
              monthly payment        - amount which must be paid each month to pay the loan on schedule

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _


Check for Implicit Requirements.  Are there requirements that are not explicitly stated?


Implicit Requirements: 
            loan amount             - money expressed as number with two digits after the dot
            annual percentage rate  - percentage expressed as number with two digits after the dot
            loan duration           - years expressed as whole number
            
            monthly interest rate   - percentage, APR/12 expressed as number with two digits after the dot
            loan duration in months - months, loan duration/12 expressed as whole number
            monthly payment         - money expressed as number with two digits after the dot

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _


Clarifying Questions:  Some questions to ask the interviewer (or perhaps yourself) to better 

understand the problem.



1. make sure that duration is expressed in years



2. single use or loop through again?



3. is there a user name?



4. is there a down payment?



_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

Mental Model:  A mental model is an explanation of someone's thought process about how something 

works in the real world.  Think of it as a summary of the "entire problem" written in your own words.

It is your perspective of *what* the problem requires--not *how*.  How is implemented in the Algorithm

section.  



As a rule of thumb, you can keep the number of mental models to one if it fully, and accurately,

captures the requirements of the problem.



Your Mental Model:

user signs in

accept inputs of loan amount in dollars, annual percentage rate in percentage and loan duration in years
process inputs to find monthly interest rate, loan duration in months. and monthly payment amount to complete loan on time
output monthly payment result to the user

ask if there is another loan to process




===================================================================================================

*** Examples / Test Cases / Edge Cases: ***



Examples: 

THE OBJECTIVE IS to come up with examples that validate your understanding of the problem, and confirm

that you are working in the right direction.  Typically the confirmation will come from documentation of 

a process, or a person.



Your Examples:

user name is john doe

home price is $300,000

annual interest rate is 7%

loan duration is 30 years

monthly interest rate is .58%

loan duration in months is 360

monthly payment is $1995.91


_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _



Test Cases:

Note: Rules for a specific problem are oftentimes an excellent place to find test cases.  If you're 

working with collections, it's a good idea to find test cases that deal with zero, one or multiple

elements in the collection.  



Try to provide test cases that handle any edge cases you can find.

If you're working with collections, it's a good idea to find test cases that deal with zero, one or

multiple elements in the collection.



Your Test Cases:

test high and low loan amounts

test high and low interest rates

test high and low loan durations

test different names


_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _



Edge Cases:

Edge cases are situations that occur along the "edge" of a specific problem.  For example: problems that 

involve iterating over numbers have edge cases that are at both ends of the range.  Typically can 

involve working with negative numbers, 0, or extremely high values.



Your Edge Cases:

test abnormal user name entries

0 and negative loan amounts

loan amount exceeds bounds of float

0 and negative interest rates

interest rates exceed bounds of float

0 and negative loan durations

loan duration exceeds bounds of int



===================================================================================================

*** Data Structure:***



Next determine what data structures you will work with to convert the input to the desired output.

THE CHIEF CONSIDERATIONS HERE are your intended programming language and your mental model.

Are you going to use arrays, hashes, etc?

Your data structure will influence your program.



messages will be exported as hash to external yaml file

user_name is literal string

loan_amount is float formatted to with dollar sign and two digits after the point

annual_rate is float formatted with two digits after the point and percent symbol

loan_duration is int formatted as years

monthly_rate is float formatted with two digits after the point and percent symbol

month_duration is int formatted as months

monthly_payment is float formatted with dollar sign two digits after the point

denom_monthlies is float

denom_subtra is float

amort_denom is float

amortization is float


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
    



monthly loan duration = loan duration * 12

monthly interest rate = anual interest rate / 12

denominator monthlies = monthly interest rate ** -monthly loan duration

denominator subtrahend = 1 + denominator monthlies

amortization denominator = 1 - denominator subtrahend

amortization = monthly interest rate / amortization denominator

monthly payment = loan amount * amortization



=end





# Code:
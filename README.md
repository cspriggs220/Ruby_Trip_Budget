#Ruby Trip Budget - CLI

##Purpose
This is my Ruby Capstone project for the Software Development Fundamentals portion of the Nashville Software School. I will be using the standard Ruby library.

The goal of this project is to create a command line budget app for a vacation, using similar features found on Mint.com.


##Project Status
This project is in the early structuring stages.

##TODO
1. The tests should use a test database.
2. `Trip.destroy_all` is not the ideal solution for testing.
3. Implement data validations.

##Features
Features for this app include being able to add expenses, track the budget's progress, and receive notifications via the terminal when they reaching their allotted budget.


##Usage Instructions
Planned usage is as follows:

To create a new trip:

    > trip add Honolulu

To list available trips:

    > trip list

To remove a trip

    > trip remove Honolulu

To set a new budget:

    > trip set Honolulu 3000

To list available expense categories:

    > trip cat

To add expense:

    > trip Lodging 485

To list total expenses:

    > trip expense list

To show budget balance:

    > trip balance

To list available commands:

    > trip man




##Known bugs
<em>Project in beginning stage.</em>


##Author
Cody Spriggs

##License
None


##Changelog
5/9/2013 - Created initial repository with README and user stories.
5/15/2013 - Setup file structure and ActiveRecord
5/19/2013 - Begin setting up separate tables for project.
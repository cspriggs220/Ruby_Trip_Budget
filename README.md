#Ruby Trip Budget - CLI

##Purpose
This is my Ruby Capstone project for the Software Development Fundamentals portion of the Nashville Software School. I will be using the standard Ruby library.

The goal of this project is to create a command line budget app for a vacation, using similar features found on Mint.com.


##Project Status
Closing in on halfway.
User can create trips, view the available expense categories, and even set budgets for those categories. Also complete is the ability to print out the balance of the trip, which shows each category's total budget, in addition to the trip's total overall budget.

##TODO
1. Create Expense functionality
2. Update each category and subsequent budget after each expense added

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

To list available expense categories:

    > trip cat

To set a new budget to an expense category:

    > trip set Honolulu Food 300

To add expense:

    > trip expense add Honolulu Lodging 485

To list total expenses:

    > trip expense Honolulu list

To show budget balance:

    > trip balance Honolulu

To list available commands:

    > trip help




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
5/20/2013 - Add create/remove/list functionality for trips.
5/21/2013 - Add setting a trip's expense category budget, as well as printing the balance of the budget for trip.
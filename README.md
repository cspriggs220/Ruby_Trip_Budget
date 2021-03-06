#Ruby Trip Budget - CLI

##Purpose
This is my Ruby Capstone project for the Software Development Fundamentals portion of the Nashville Software School. I will be using the standard Ruby library.

The goal of this project is to create a command line budget app for a vacation, using similar features found on Mint.com.


##Project Status
[![Build Status](https://travis-ci.org/cspriggs220/Ruby_Trip_Budget.png)](https://travis-ci.org/cspriggs220/Ruby_Trip_Budget)
[![Code Climate](https://codeclimate.com/github/cspriggs220/Ruby_Trip_Budget.png)](https://codeclimate.com/github/cspriggs220/Ruby_Trip_Budget)

Completed basic implementation, including trip add/remove/list, budet setting, and expense add/list with remaining balance for said category. Project not complete.

##TODO
2. Add warning message when removing a trip, along with message that the trip was removed.
3. Add ding for reaching n percentage of allotted budget.
4. Add help functionality
5. Add instructions on how to use the ./trip command to README.
6. Implement routes instead of if command == in exe file.
7. Add other errors for wrong/invalid arguments passed.
1. Add colors and other makeup to provide better visualization.

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

    > trip expense Honolulu Lodging 485

To list total expenses:

    > trip expense list Honolulu

To show the trip's budget:

    > trip balance Honolulu

To list available commands:

    > trip help




##Known bugs
1. Doesn't account for multiple expenses per category.
2. Removing a trip doesn't wipe out all trip associations in the db.


##Author
Cody Spriggs

##License
None


##Changelog
1. 2013/5/9 - Create initial repository with README and user stories.
2. 2013/5/15 - Setup file structure and ActiveRecord
3. 2013/5/19 - Begin setting up separate tables for project.
4. 2013/5/20 - Add create/remove/list functionality for trips.
5. 2013/5/21 - Add setting a trip's expense category budget, as well as printing the balance of the budget for trip.
5. 2013/5/24 - Add expenses table on database, and begin adding expense functionality.
5. 2013/5/31 - Refactor expense controller.
1. 2013/6/04 - Add Formatter module and refactor controllers

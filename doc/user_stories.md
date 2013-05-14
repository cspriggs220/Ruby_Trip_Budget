# User Stories for Trip Budget
<hr>

As a travel enthusiast<br />
In order to see more of the world<br />
I want to plan a trip to Honolulu

- User runs `> trip add Honolulu`
<hr>

As a smart consumer<br />
In order to spend within my means<br />
I want to create a budget for this trip

- User runs `> trip set Honolulu <amount>`
<hr>

As a smart consumer<br />
In order to stick to the budget<br />
I want to keep track of my expenses

- User runs `> trip list cat` to view expense categories
- User runs `> trip <category_name> <amount>`
<hr>

As a smart consumer<br />
In order to stick to the budget<br />
I want to be alerted when I reach a percentage of the total budget

- A ding is sounded and a warning message is displayed when the user reaches a specific percentage of their budget.
<hr>

As a smart consumer<br />
In order to stick to the budget<br />
I want to be able to see the balance of my budget

- User runs `> trip balance` to see remaining budget amount
<hr>

As a smart consumer<br />
In order to see how I've spent my money so far<br />
I want to be able to print out all expenses

- User runs `> trip list`

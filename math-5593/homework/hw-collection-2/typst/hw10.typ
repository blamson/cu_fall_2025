= Homework 10

== Problem

Explain in your own words why the model in Vanberbei Ch 23-2 (pg 393) is a correct TSP model. 

Discuss what is better and worse compared to models 1 and 2 from lecture slides 12. 

== Solution

Without writing out the model, the books handles the traveling salesman problem using an integer program. At its core, we have a set of cities and weighted connections between those cities. The goal of this model is to minimize the overall cost of visiting each city once and then returning to the start. We refer to this closed cycle as a *tour*. 

 This model using binary decision variables $x_(i j)$ where $i$ is the "from" city and $j$ is the "to" city. The variable $x_(i j) = 1$ indicates that the connect from city $i$ to city $j$ was used, and the variable is $0$ otherwise. Each of these connections has an associated cost, so the objective function sums up the costs from the connections used.

 Each tour is looked at as a sequence of cities visited, and so a lot of the constraints focus on making sure the sequence is well behaved. There are *go to* and *come from* constraints that ensure a certain city is only visited once.

 $
  sum_(j=1)^n x_(i j) &= 1 & "Only go to each city once"\
  sum_(i=1)^n x_(i j) &= 1 & "Only leave each city once"\
 $
 
Additional constraints enforce that the tour order is well-behaved and prevents subtours. This is done using variables $t_i$, which represents the position of city $i$ in the tour. The ordering constraints require that if the tour goes from city $i$ to city $j$, then

 $
   t_j &>= t_i + 1
 $ 

This forces a consistent ordering of visits. Any subtour that ignores any cities would violate these constraints.

This setup is intuitive to set up and it has all of the constraints necessary to ensure the correct behavior for the TSP. How this differs from model 1 and model 2 in the slides is that focus on sequence. The graph solutions meanwhile focus on framing this as a network.

For example, the graph approach forces each city to have two edges used each. This makes sense based on the integer solution, we need an edge for leaving a city and one for approaching it. Subtours are handled using constraints like $sum_(e in delta(S)) >= 2$ that require enough edges leaving any given subset are used. 

Really all three of these models tackle the same thing. They just use slightly different ways of approaching the problem. The integer problem focuses on the behavior of sequences and the graph solution focuses on the behavior of networks.
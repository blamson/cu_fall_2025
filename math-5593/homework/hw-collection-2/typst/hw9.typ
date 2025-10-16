#import "@preview/tablem:0.3.0": tablem

= Homework 9: AMPL Exercise 20-4

== Part A

=== Problem

Formulate an AMPL model for the kanpsack problem using the provided information.

=== Solution

I'll keep it simple here.

*DATA*

```
set OBJECTS:= a b c d e f g h i j;
param weight_limit := 100;

param: weight :=
    a 55
    b 50
    c 40
    d 35
    e 30
    f 30
    g 15
    h 15
    i 10
    j 5 ;

param: value :=
    a 1000
    b 800
    c 750
    d 700
    e 600
    f 550
    g 250
    h 200
    i 200
    j 150 ;
```

*MODEL*

```
set OBJECTS;
param weight {OBJECTS} > 0;
param value {OBJECTS} > 0;
param weight_limit > 0;

var Use {OBJECTS} integer >= 0, <= 1; # ensure item can only be used once. 

maximize Total_Value:
    sum {i in OBJECTS} value[i] * Use[i];

subject to Weight_Limit:
    sum {i in OBJECTS} weight[i] * Use[i] <= weight_limit;
```

Overall this solution is very straightforward.

*OUTPUT*

```
Total_Value = 2000

: Use  value weight    :=
a   0   1000    55
b   0    800    50
c   0    750    40
d   1    700    35
e   1    600    30
f   1    550    30
g   0    250    15
h   0    200    15
i   0    200    10
j   1    150     5
```

I don't have a lot to say here. It works. We're picking all of the most efficient items for value/weight we can fit into the given weight limit. 

== Part B

=== Problem

Suppose instead you want to fill several identical knapsacks. Formulate an AMPL model for this situation while keeping in mind that an item can only go into a single knapsack. For this specific problem, solve for 2 knapsacks each with a weight limit of 50. 

=== Solution

A few updates to make to the model mostly. We mostly need to make sure indexing across knapsacks works properly and that an item is limited to being in a single knapsack. 

*MODEL UPDATES*

```
param knapsacks integer > 0;

var Use {i in OBJECTS, k in 1..knapsacks} integer >= 0, <= 1; 

subject to One_Knapsack{i in OBJECTS}:
    sum {k in 1..knapsacks} Use[i, k] <= 1;
```

aside from those changes we just make sure that any time `Use` comes up we include that additional `k` index. This allows us to check the weight limits for all the individual knapsacks. Like so.

```
subject to Weight_Limit{k in 1..knapsacks}:
    sum {i in OBJECTS} weight[i] * Use[i, k] <= weight_limit;
```

*DATA UPDATES*

The only modifications here are adding a new parameter and updating the global weight limit.

```
param weight_limit := 50;
param knapsacks := 2;
```

*OUTPUT*

Here we get a total value of 1950. Below is a cleaned up table to show the items used per bag. 

#tablem[
| Item | Bag 1 | Bag 2 |
| ---- | - | - |
| a    | 0 | 0 |
| b    | 0 | 0 |
| c    | 1 | 0 |
| d    | 0 | 0 |
| e    | 0 | 1 |
| f    | 0 | 0 |
| g    | 0 | 1 |
| h    | 0 | 0 |
| i    | 1 | 0 |
| j    | 0 | 1 |
]

Interestingly enough we have a slightly lower total value than part A. This is because of that restrictive 50 weight limit for each bag. We can't use D E and F in our solution as any combination of those items puts us over either bags limit. So we make do with a slightly lower total value. 

== Part C

=== Problem

Superficially, the preceding knapsack problem resembles an assignment problem; we have a collection of objects and a collection of knapsacks, and we want to make an optimal assignment from members of the former to members of the latter. What is the essential difference between the kinds of assignment problems described in Section 15.2, and the knapsack problem described in (b)?

=== Solution

The knapsack problem, in my opinion, closesly matches the bipartite network graph they use for some assignment examples. Thinking about which objects best go into which knapsacks is, in a way, very similar to the example used for assigning employees to the offices they best match. One item can only go to one knapsack much like one employee can only work at a single office. In our case, we would have a node for each item and then on the other side a node for each knapsack. It's very similar conceptually. 

The key difference here, I believe, is that the knapsacks in (b) are identical to one another. Whereas in the assignment problems there would be different "weights" or "scores" for the different destinations of the given items. So in 15.2 we would have a knapsack an item best matches, which we don't have here. 

== Part D

=== Problem

Modify the formulation from part (a) so that it accommodates a volume limit for the knapsack as well as a weight limit. 

How do the total weight, volume and value of this solution compare to those of the solution you found in (a).

=== Solution

A volume limit wasn't actually provided for this problem so I made up one of 6. 

Updates here pretty much just mirror how weight limit was set up initially.

*MODEL UPDATES*

```
param volume_limit > 0;

subject to Volume_Limit:
    sum {i in OBJECTS} volume[i] * Use[i] <= volume_limit;
```

*DATA UPDATES*

```
param volume_limit := 6;

param: volume :=
    a 3
    b 3
    c 3
    d 2
    e 2
    f 2
    g 2
    h 1
    i 1
    j 1 ;
```

*OUTPUT*

```
Total_Value = 1900

: Use  value volume weight    :=
a   1   1000    3      55
b   0    800    3      50
c   0    750    3      40
d   1    700    2      35
e   0    600    2      30
f   0    550    2      30
g   0    250    2      15
h   0    200    1      15
i   1    200    1      10
j   0    150    1       5
```

We see yet another drop in total value here. This is because the solution in (a) is only possible with a volume limit of 7 or larger. This actually prompts item a from being used for once which is interesting. Of note that we still hit the weight limit of 100 exactly here. 

== Part E

=== Problem

How can the media selection problem of Exercise 20-1 be viewed as a knapsack problem like the one in (d)?

=== Solution

Exercise 20-1 is all about an advertising campaign and choosing what kind of mediums to use for advertising. There is a limited budget, and a variety of parameters assigned to each of the mediums. Our choice is whether to use a certain medium or not. The goal is to maximize the audience subject to budget and time constraints. 

This is pretty much a more complicated version of what we did in part (d). We have a knapsack that, instead of weight and volume limits, has money and time constraints. It is more of a theoretical container but it still works. The choice of medium is also binary, much like the choice of item. Do we put the item in the bag or not? Do we use a given medium for advertising or not? Instead of maximizing item "value" we're maximizing the audience we reach. It's a near identical setup really. 

== Part F

=== Problem 

Suppose that you can put up to 3 of each object in the knapsack, instead of just 1. Revise the model, discuss how the solution changes.

=== Solution

All we change is:

```
var Use {OBJECTS} integer >= 0, <= 3; 
```

*OUTPUT*

```
Total_Value = 2150

: Use  value weight    :=
a   0   1000    55
b   0    800    50
c   0    750    40
d   1    700    35
e   1    600    30
f   0    550    30
g   0    250    15
h   0    200    15
i   2    200    10
j   3    150     5
```

Not as big of a jump in total value as I expected, but it is still 150 higher than in (a). Here the only items we use multiples of are the very light and efficient items `i` and `j`. These are very easy to fit into any weight limit and provide far more bang for their buck than the others. Note that we no longer use `f` as both `i` and `j` have a better value/rate ratio than it. With 2 additional `j` AND `i` objects we get a value of 700 from that 30 weight instead of `f`'s 550. 
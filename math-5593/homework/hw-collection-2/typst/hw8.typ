= Homework 8: AMPL Exercise 18-5

A caterer has booked dinners for the next $T$ days, and has as a result a requirement for a certain number of napkins each day. He has a certain initial stock of napkins, and can buy new ones each day at a certain price. In addition, used napkins can be laundered either at a slow service that takes $4$ days, or at a faster but more expensive service that takes $2$ days. The caterer's problem is to find the most economical combination of puchase and laundering that will meet the forthcoming demand. 

== Part A

=== Problem

The book provides the following decision variables:

```
var Buy[t]        # clean napkins bought for day t
var Carry[t]      # clean napkins still on hand at the end of day t.
var Wash2[t]      # used napkins sent to the fast laundry after day t
var Wash4[t]      # used napkins sent to the slow laundry after day t
var Trash[t]      # used napkins discarded after day t
```

There are 2 collections of constraints on these variables, described as such:
1. The number of clean napkins acquired through purchase, carryover and laundering on day $t$ must equal the number sent the laundering, discarded or carried over _after_ day $t$.
2. The number of used napkins laundered or discarded after day $t$ must equal the number that were required for that day's catering. 

=== Solution

For this problem I'll be building an AMPL model from scratch. The goal here was to build a set of parameters that would play nice with the provided variables. 

#include "code-chunks/napkins-mod.typ"

== Part B

=== Problem

Formulate an alternative network linear programming model for this problem. Write it in AMPL using node and arc declarations. 

=== Solution

This one took me a little while to figure out. According to the book, as a general statement, we use `arc` and `node` to take the place of `var` and `subject to` respectively. So there's a lot of reworking here. The objective function simplifies a lot here as well which is nice. 

#include "code-chunks/napkins-network-mod.typ"

== Part C

=== Problem

The "caterer problem" was introduced in a 1954 paper by Walter Jacobs of the U.S. Air Force. Although it has been presented in countless books on linear and network programming, it does not seem to have ever been used by any caterer. In what application do you suppose it really originated?


=== Solution

There is an interesting article on this man titled *Eloge: Walter W. Jacobs, 1914-1982* by Joseph Blum et al. written in 1984. It actually brings up his history in the Air Force and the exact motivation behind this problem. To oversimplify, the problem involved the engines of aircraft. 

#quote(attribution: [Robert L. Kirby])[
  1. Engines are procured for aircraft.
  2. An engine flies a certain number of hours and then is shipped to an overhaul facility. The shipment can be done by slow surface transportation or fast airlift. The fast method is assumed to be more expensive.
  3. At some time the aircraft are phased out, and an inventory of engines must be written off.
]

This is a very similar setup, it's kind of funny. It's pretty easy to see how this was modified to become napkins and laundry. This is unsurprising, many mathematical advances in optimization came about because of military applications. 

Full source of the article: Annals of the History of Computing, Volume 6, Number 2, April 1984.

== Part D

=== Problem

Since this is an artificial problem, you might as well make up your own data for it. Use your data to check that the formulations in (a) and (b) give the same optimal value.

=== Solution

I kept the data pretty simple here and just randomly generated some daily demands.

#include "code-chunks/napkins-data.typ"

All of these values are totally arbitrarily.

*Traditional AMPL model Output*

#include "code-chunks/napkins-model-output.typ"

*Network Model Output*

#include "code-chunks/napkins-network-output.typ"

What we see here is that, though there are some slight difference in strategy on day 4, that both solutions reach the same total cost. 
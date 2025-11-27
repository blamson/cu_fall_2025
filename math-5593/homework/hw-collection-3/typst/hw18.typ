= Homework 18

== Problem

Dualize the first LP (page 3) in the AMPL book and give an economic interpretation of the dual. 

== Solution

The LP in the book is provided as such:

$
  "max" 25 x_B + 30 x_c \
  "s.t." 1/200 x_b + 1/140 x_c &<= 40 \
  0 <= x_B &<= 6000 \
  0 <= x_C &<= 4000 \
$

The objective function values represent the "Profit per ton". The first constraint represents the hours constraint, where the values show the rate of production for bands and coils (hours per ton). The last two constraints are production weight limits on bands and coils respectively in tons. 

Some basic cleanup gets us the following set of constraints:

$
  "s.t." 1/200 x_b + 1/140 x_c &<= 40 \
  x_B &<= 6000 \
  x_C &<= 4000 \
  x_B, x_C &>= 0
$

And we can rewrite all of this as:

$
  A = mat(1/200, 1/140;1,0;0,1), b=mat(40;6000;4000), c=mat(25;30), x=mat(x_B;x_C)
$

So the primal can now be written as:

$
  max c^T x \
  "s.t." A x <= b \
  x >= 0
$

*Dual Problem*

Converting to the dual gives us the following form:

$
  min b^T y \
  A^T y >= c \
  y >= 0
$

With $A^T = mat(1/200, 1, 0;1/140, 0, 1)$. 

Substituting in all of the values from the primal gives us:

$
  min 40y_H + 6000y_B + 4000y_C& \
  "s.t." 1/200 y_H + y_B + 0y_C &>= 25 \
  1/140 y_H + 0y_B + y_C &>= 30 \
  y_H, y_B, y_C &>= 0
$

*Interpretation*

Let's say we have a guy named Ted and he's the one buying all the resources the factory needs. He wants to spend as little as possible on resources while still guaranteeing enough production so that the profits in the primal are realized. 

Ted also wants to make sure the factory is getting the most out of its production. As an example, if the value of $y_C$ is extremely large, that would indicate to Ted that the production constraints on coils is causing some profit to be left on the table. Ted would be able to show this value to stakeholders to show them how much more profit would be realized if an additional ton of coils was allowed to be produced. 

On the other hand; if $y_H = 0$, that would tell Ted that the number of hours of production isn't a limiting factor on profit and increasing it any further wouldn't help. 

*REWRITING NOTES*

Discuss that the person buying resources and setting resource constraints is benevolent and has the factories best interest at mind. They are at an adversarial role to the maximization guy though, why is that? Also go into more detail on what the exact coefficients and objective function mean. More detail, not enough.
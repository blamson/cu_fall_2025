(b) As a first step toward formulating a stochastic program, consider how the three scenarios could
be brought together into one linear program. Define a parameter S as the number of scenarios, and
replicate the revenue data over the set 1..S:
param S > 0;
param revenue {PROD,1..T,1..S} >= 0;
Replicate all the variables and constraints in a similar way. (The idea is the same as earlier in this
chapter, where we replicated model components over products or weeks.)
Define a new collection of parameters prob[s], to represent your estimate of the probability that
a scenario s takes place:
param prob {1..S} >= 0, <= 1;
check: 0.99999 < sum {s in 1..S} prob[s] < 1.00001;
The objective function is the expected profit, which equals the sum over all scenarios of the proba-
bility of each scenario times the optimum profit under that scenario:
maximize Expected_Profit:
sum {s in 1..S} prob[s] *
sum {p in PROD, t in 1..T} (revenue[p,t,s]*Sell[p,t,s] -
prodcost[p]*Make[p,t,s] - invcost[p]*Inv[p,t,s]);
Complete the formulation of this multiscenario linear program, and put together the data for it. Let
the probabilities of scenarios 1, 2 and 3 be 0.45, 0.35 and 0.20, respectively. Show that the solu-
tion consists of a production strategy for each scenario that is the same as the strategy in (a).
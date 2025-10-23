
set NUTR;

set FOOD_ALL;
set FOOD_DROP within FOOD_ALL default {};
set FOOD := FOOD_ALL diff FOOD_DROP;

param cost {FOOD_ALL} > 0;
param f_min {FOOD_ALL} >= 0;
param f_max {j in FOOD_ALL} >= f_min[j];

param n_min {NUTR} >= 0;
param n_max {i in NUTR} >= n_min[i];

param amt {NUTR,FOOD_ALL} >= 0;

var Buy {j in FOOD} >= f_min[j], <= f_max[j];

minimize total_cost:  sum {j in FOOD} cost[j] * Buy[j];

subject to diet {i in NUTR}:
   n_min[i] <= sum {j in FOOD} amt[i,j] * Buy[j] <= n_max[i];

set OBJECTS;
param weight {OBJECTS} > 0;
param value {OBJECTS} > 0;
param weight_limit > 0;
param knapsacks integer > 0;

var Use {i in OBJECTS, k in 1..knapsacks} integer >= 0, <= 1; 

maximize Total_Value:
    sum {i in OBJECTS, k in 1..knapsacks} value[i] * Use[i, k];

subject to Weight_Limit{k in 1..knapsacks}:
    sum {i in OBJECTS} weight[i] * Use[i, k] <= weight_limit;

subject to One_Knapsack{i in OBJECTS}:
    sum {k in 1..knapsacks} Use[i, k] <= 1;
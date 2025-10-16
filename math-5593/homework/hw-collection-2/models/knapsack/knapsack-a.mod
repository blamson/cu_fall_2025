set OBJECTS;
param weight {OBJECTS} > 0;
param value {OBJECTS} > 0;
param weight_limit > 0;

var Use {OBJECTS} integer >= 0, <= 1; # ensure item can only be used once. 

maximize Total_Value:
    sum {i in OBJECTS} value[i] * Use[i];

subject to Weight_Limit:
    sum {i in OBJECTS} weight[i] * Use[i] <= weight_limit;
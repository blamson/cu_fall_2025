set PROD;   # products
set STAGE;  # stages

param rate {PROD,STAGE} > 0; # tons per hour in each stage
param avail {STAGE} >= 0;    # hours available/week in each stage
param share {PROD} >= 0;     # minimum proportion of total tons for each product
param profit {PROD};         # profit per ton

param market {PROD} >= 0;    # upper limit on tons sold in week

var Make {p in PROD} >= 0, <= market[p]; # tons produced

maximize Total_Profit: sum {p in PROD} profit[p] * Make[p];

               # Objective: total profits from all products

subject to Time {s in STAGE}:
   sum {p in PROD} (1/rate[p,s]) * Make[p] <= avail[s];

               # In each stage: total of hours used by all
               # products may not exceed hours available

subject to Share {p in PROD}:
    Make[p] >= share[p] * sum {k in PROD} Make[k];

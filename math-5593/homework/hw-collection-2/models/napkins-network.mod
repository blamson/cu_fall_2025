# Parameters ---
param T integer > 0;
set DAYS := 1..T;
param demand{DAYS} integer >= 0;                 # Number of napkins needed on day t
param napkin_price > 0;                          # Buy price per single napkin
param wash2_price > 0;                           # Price per napkin for fast laundry
param wash4_price > 0;                           # price per napkin for slow laundry

node Available {t in DAYS};
node Used {t in DAYS}: net_out = -demand[t];
node Store;
node Trash;

minimize Total_Cost;

arc Demand {t in DAYS} >= 0,
    from Available[t], to Used[t];

arc Carry {t in 1..T-1} >=0,
    from Available[t], to Available[t+1];

arc Buy {t in DAYS} >= 0,
    from Store, to Available[t], obj Total_Cost napkin_price;

arc FastLaundry {t in 1..T-2} >= 0,
    from Used[t], to Available[t+2], obj Total_Cost wash2_price;

arc SlowLaundry {t in 1..T-4} >= 0,
    from Used[t], to Available[t+4], obj Total_Cost wash4_price;

arc TrashFlow {t in DAYS} >= 0,
    from Used[t], to Trash, obj Total_Cost 0;
# Parameters ---
param T integer > 0;
set DAYS := 1..T;
param initial_stock integer >= 0;                # napkins available for start of day 1
param demand{DAYS} integer >= 0;                 # Number of napkins needed on day t
param napkin_price > 0;                          # Buy price per single napkin
param wash2_price > 0;                           # Price per napkin for fast laundry
param wash4_price > 0;                           # price per napkin for slow laundry

node Available {t in DAYS}: net_out = 0;
node Used {t in DAYS}: net_out = 0;
node Stock: net_out = initial_stock;             # functions basically as carry[0]
node Store: net_out >= 0;                        # Provides napkins to days
node Trash: net_in >= 0;

minimize Total_Cost;

arc InitialNapkins <= initial_stock,
    from Stock, to Available[1];

arc Demand {t in DAYS} >= demand[t],
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
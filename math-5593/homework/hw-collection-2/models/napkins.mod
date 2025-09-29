# Parameters ---
param T integer > 0;
set DAYS := 1..T;
param initial_stock integer >= 0;                # napkins available for start of day 1
param demand{DAYS} integer >= 0;                # Number of napkins needed on day t
param napkin_price > 0;                          # Buy price per single napkin
param wash2_price > 0;                           # Price per napkin for fast laundry
param wash4_price > 0;                           # price per napkin for slow laundry

# Decision Variables ---
var Buy{t in DAYS} integer >= 0;         # clean napkins bought for day t
var Carry{t in 0..T} integer >= 0;    # clean napkins still on hand at the end of day t. 0 included for initial stock
var Wash2{t in DAYS} integer >= 0;    # used napkins sent to the fast laundry after day t
var Wash4{t in DAYS} integer >= 0;    # used napkins sent to the slow laundry after day t
var Trash{t in DAYS} integer >= 0;    # used napkins discarded after day t

# Objective function ---
minimize Total_Cost:
        sum {t in DAYS} (napkin_price * Buy[t]
        + wash4_price * Wash4[t]
        + wash2_price * Wash2[t]);

# Constraints ---

subject to InitialCarry:
        Carry[0] = initial_stock;

# The number of clean napkins acquired through purchase, carryover and laundering on day t
# must equal the number sent to laundering, discarded or carried over after day t.
# Basically, this check ensures that we're tracking all the untrashed napkins correctly
subject to HandlingInventory {t in DAYS}:
        Buy[t] 
        + Carry[t-1]
        + (if t-2 >= 1 then Wash2[t-2] else 0)
        + (if t-4 >= 1 then Wash4[t-4] else 0)
        = demand[t] + Carry[t];

# The number of used napkins laundered or discarded after day t
# must equal the number that were required for that day’s catering.
subject to UsedNapkins {t in DAYS}:
        Wash2[t] + Wash4[t] + Trash[t] = demand[t];
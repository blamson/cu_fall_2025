*Parameters*

For starters, these are all identical to the previous model. These do not need to change whatsoever.

*Nodes*

These function as our variables in this context. I visualized this network as having two components to each day. We have an available node per day and a used node per day. This allows the napkins demanded for a day have an organic way to flow out for laundry and trash. The laundry simply has the used node point to the correct available node down the line. From there we have a node for initial stock, one for a store to buy napkins from and another one for the trash. 

```
node Available {t in DAYS}: net_out = 0;
node Used {t in DAYS}: net_out = 0;
node Stock: net_out = initial_stock;        # functions basically as carry[0]
node Store: net_out >= 0;                   # Provides napkins to days
node Trash: net_in >= 0;
```

The `net_out` for available and used ensure that any napkins taken into those nodes are moved out. The store can push out as many napkins as necessary and the trash can take in as many. 

*Objective Function*

`minimize Total_Cost;`

Yup, that's it. The arcs will handle this value automatically. 

*Arcs*

This is how we dictate the flow of napkins. We need a lot of these to handle all of our options. They're all pretty intuitive though.

```
arc InitialNapkins <= initial_stock,
    from Stock, to Available[1];

arc Demand {t in 1..DAYS} >= demand[t],
    from Available[t], to Used[t];

arc Carry {t in 1..T-1} >=0,
    from Available[t], to Available[t+1];

arc Buy {t in 1..DAYS} >= 0,
    from Store, to Available[t], obj Total_Cost napkin_price;

arc FastLaundry {t in 1..T-2} >= 0,
    from Used[t], to Available[t+2], obj Total_Cost wash2_price;

arc SlowLaundry {t in 1..T-4} >= 0,
    from Used[t], to Available[t+4], obj Total_Cost wash4_price;

arc TrashFlow {t in 1..DAYS} >= 0,
    from Used[t], to Trash, obj Total_Cost 0;
```

We can see that some of these arcs have a cost associated with them, those will be what alter the value of the objective function. 
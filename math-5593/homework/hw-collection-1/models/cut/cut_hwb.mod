# ----------------------------------------
# CUTTING STOCK USING PATTERNS
# ----------------------------------------

param roll_width > 0;         # width of raw rolls

set WIDTHS;                   # set of widths to be cut
param orders {WIDTHS} > 0;    # number of each width to be cut

param nPAT integer >= 0;      # number of patterns
set PATTERNS = 1..nPAT;      # set of patterns

param nbr {WIDTHS,PATTERNS} integer >= 0;

   check {j in PATTERNS}:
      sum {i in WIDTHS} i * nbr[i,j] <= roll_width;

                            # defn of patterns: nbr[i,j] = number
                            # of rolls of width i in pattern j

var Cut {PATTERNS} integer >= 0;   # rolls cut using each pattern

minimize Number:                   # minimize total raw rolls cut
   sum {j in PATTERNS} Cut[j];

subject to Fill {i in WIDTHS}:
   0.9 * orders[i] <= sum {j in PATTERNS} nbr[i,j] * Cut[j] <= 1.4 * orders[i];

                                   # for each width, total
                                   # rolls cut meets total orders

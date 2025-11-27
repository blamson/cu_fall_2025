#table(
  columns: (auto, auto, 1fr),
  align: (left, center, left),

  // Header row
  [*Problem*], [*Complexity*], [*Key Reason*],

  // ————————————————————————————————
  // LINEAR PROGRAMMING (NP-easy / P)
  // ————————————————————————————————
  [Linear Programming (LP)], [NP-easy / in P],
  [Feasible region is convex and continuous; solvable in polynomial time via interior-point or ellipsoid methods.],

  [Transportation Problem], [NP-easy / in P],
  [Special LP with network flow structure; total unimodularity ensures integer solutions when RHS is integer.],

  [Assignment Problem], [NP-easy / in P],
  [Equivalent to a min-cost flow; constraint matrix is totally unimodular, so LP relaxation gives integer solutions.],

  [Network Flow], [NP-easy / in P],
  [Solvable by specialized combinatorial algorithms (Ford–Fulkerson, Edmonds–Karp); polynomial time guaranteed.],

  [Transshipment Problem], [NP-easy / in P],
  [Generalization of transportation problem; inherits convexity and total unimodularity properties.],

  [Diet Problem], [NP-easy / in P],
  [Standard LP; continuous feasible region with linear constraints and linear objective.],

  // ————————————————————————————————
  // INTEGER / COMBINATORIAL (NP-hard)
  // ————————————————————————————————
  [Integer Linear Programming (ILP)], [NP-hard],
  [Discrete feasible set; solving requires combinatorial search (branch and bound, cutting planes).],

  [Binary Integer Programming (BIP)], [NP-hard],
  [Variables restricted to {0,1}; generalizes SAT and subset selection problems.],

  [Knapsack Problem], [NP-hard],
  [Choosing subset of items is combinatorial; LP relaxation not integral.],

  [Sudoku (as Integer Program)], [NP-hard],
  [Discrete assignment with distinctness constraints; LP relaxation yields fractional solutions.],

  [Traveling Salesman Problem (TSP)], [NP-hard],
  [Permutation-based search over factorially many tours; feasible region is non-convex.],

  [Graph Coloring / Clique / SAT], [NP-hard],
  [Combinatorial feasibility problems; checking validity itself is NP-complete.],

  // ————————————————————————————————
  // BOUNDARY / SPECIAL CASES
  // ————————————————————————————————
  [Continuous Sudoku or TSP LP], [NP-easy / in P],
  [Dropping integrality makes it a convex LP solvable in polynomial time, though solutions lose combinatorial meaning.],

  [Mixed-Integer LP (MILP)], [NP-hard],
  [Combines continuous and integer variables; inherits NP-hardness from ILP portion.]
)

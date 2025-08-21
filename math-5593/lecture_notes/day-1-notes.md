# DAY 1 LINEAR PROGRAMMING NOTES ---

## Foundations of linear programming ---
### contents of the course ---
Three large topics
	- Models: Ways to formulate real world problems for processing by mathematical algorithms. 
	- Algorithms: Techniques for solving models. Not a standard definition. There are dozens and dozens and dozens of definitions for algorithms.
	- Software: Engines for executing algorithms.

## History of linear programming ---

### BEFORE LINEAR PROGRAMMING ---
1665: Finding a minimum solution of a function. 
	- First person to work on these topics: Newton. 
		- Recall the Newton method of optimization! 
		
1788: Lagrangian Multipliers
	- Lagrange
	- Taking a lot of technically unconstrained problems and forcing constraints on them to be able to apply Newton's method. 

1823: Solution of a Set of inequalities. 
	- Fourier

1826: Solution of a set of linear equations
	- Gauss

1896: Solution of a Set of linear equations as a combination of extreme points
	- Minkowski

1936: Transposition Theorem and Linear Inequalities
	- Motzkin

### BEGINNINGS OF LINEAR PROGRAMMING ---
1939: Mathematical Methods of Organization and Production
	- Kantorovich (Nobel Prize 1975)
	- Now looking at world war 2 times and optimization of allocation of resources was very important to military operations.

1941: Transportation Problem (THE linear programming problem basically)
	- Hitchcock

1947: Linear Programming Model
	- Dantzig

1951-ish: Simplex Method
	- Dantzig

### LATER ADVANCEMENTS OF LINEAR PROGRAMMING ---
1958: Integer Programming
	- Gomory, Johnson, Balas

1979: Ellipsoid Methods

	- Khachiyan 
1984: Interior Point Methods

	- Guaranteed to run in polynomial time AND is efficient.
	- Karmarkar, an indian mathematician
	- Caused a LOT of drama. Took until the 90s to be widely accepted. Now one of the most competitive ways to solve linear programming problems.

## Optimization and Calculus ---
(cant write in mathematical notation here)
Refer to professors notes on this section.

In general, recall how calculus tackles optimization. 1st and 2nd derivatives, finding local minimums/maximums and going from there. Linear programming can do so much more than that. 

## Optimization and Linear Algebra ---

Linear Systems of Equations. $Ax = b$ with $m$ many equations in $n$ many variables. 

$A \in \mathbb{R}^{m \times n}$: matrix with rows $a_i \in \mathbb{R}^n$ for $i=1, ... ,m$. 

So each row in the A matrix has n columns and m rows. So the top left element is $a_{1,1}$ and the bottom right is $a_{m,n}$. 

$b \in \mathbb{R}^m, x \in \mathbb{R}^n$: column vectors

$b = (b_1, ..., b_m)^T \in \mathbb{R}^m$. Right hand sides. 
$x = (x_1, ..., x_n)^T \in \mathbb{R}^n$. Variables.

When does $Ax=b$ become interesting for optimization?

## Notation notes ---
- s.t. stands for 'subject to'. Such as in 's.t. constraints'.
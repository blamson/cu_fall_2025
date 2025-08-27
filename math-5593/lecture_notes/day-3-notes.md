# HOMEWORK A:

Install AMPL and/or ampl for python stuff. URL will be sent out. 

Reading: Vanderbei chapter 1 (intro)

# HOMEWORK B:

Do the same exercise as today, but remove different variables. Say, $x_1$ and $x_2$. 

# Notes

Each set $H = \{ x \in \mathbb{R}^n: a_i^Tx=b_i \}$ is a hyperplane. Were $a_i^T$ is a row of $A$. 

---

**Example:** Generalization of plane in $\mathbb{R}^3$

flat level set of dimension $n-1$. This is because if we know $n-1$ variables the final variable is forced. So $n-1$ variables are free to vary. 

A hyperplane induces two half spaces. The positive and negative half spaces. 

$H^+ = \{x \in \mathbb{R}^n: a_i^T x \geq b_i\}$ and $H^- = \{x \in \mathbb{R}^n: a_i^T x \leq b_i\}$ 

The **normal vector** $a_i \in \mathbb{R}^n$ points orthogonally into $H^+$. $H$ can be considered a level set with respect to $a_i^Tx$. 

Basically. This set up allows us to scale up into higher dimensional spaces. The notes online show a graph showing an example 2d line. 

**End example**

---

The feasible region of an LP in canonical form is the intersection of finitely many halfspaces.

**Polyhedral Sets** are finite intersection of halfspaces.

- polyhedron 
- polytope (bounded polyhedron). 
- Think like a hexagon in space providing us the region to optimize over. 

The feasible sets of linear programming are called **polyhedra**. 

The set $S = \{ x \in \mathbb{R}^n: Ax=b \}$ is an **affine subspace**. 

The set $S_0 = \{ x \in \mathbb{R}^n: Ax=0 \}$ is a **linear subspace**. 

These guys are parallel to one another. $S_0$ is just one solution to this equation that runs through the origin whereas $S$ runs through a particular solution $p$. 

Special case: hyperplanes are $n-1$ dimensional affine subspaces. 

The set $C = \{ x \in \mathbb{R}^n: x \geq 0 \}$ is a special convex cone. Otherwise known as **the first orthant**.

- A set $C$ is a cone if $a \cdot c \in C$ whenever $c \in C$ and $a \geq 0$. In other words a cone is closed under scaling. 

- A set $C$ is convex if $(1-a)c + a\cdot d \in C$ whenever $c,d \in C$ and $0 \leq a \leq 1$.

The feasible region of an LP in standard form, $Ax=b, x \geq 0$ is the intersection of an affine subspace with a convex cone/the first orthant. 

## Visualization Example

uhhhhhh, refer to the written notes for the actual visuals. 

Scratchy latex work.

Setup: 

$x_1 + 2x_2 + 3x_3 = 6$

$x_1 + x_2 + x_3 + x_4 = 4$

$x_1, x_2, x_3, x_4 \geq 0$

Problem: Remove $x_1$ and $x_4$ from this system.

Then

$x_1 = 6 - 2x_2 - 3x_3$

(second equation, sub in $x_1$)

$(6 - 2x_2 - 3x_3) + x_2 + x_3 + x_4 = 4$

$6 - x_2 - 2x_3 + x_4 = 4$

Here we collect $x_4$ and $x_1$ 

$x_4 = -2 + x_2 + 2x_3 \geq 0$

$x_1 = 6 - 2x_2 - 3x_3 \geq 0$

$-2 + x_2 + 2x_3 \geq 0$

$6 - 2x_2 - 3x_3 \geq 0$ 

Then clean up the inequalities

$x_2 + 2x_3 \geq 2$

$2x_2 - 3x_3 \leq 6$ 

$x_2, x_3 \geq 0$

Then you can easily plot and visualize this setup.

# Vertices

$x$ is a vertex (or extreme point) of a polyhedron $P$ if $x=y=z$ whenever $x=ay+(1-a)z$ for $y,z \in P$ and $0 \leq a \leq 1$.

$x$ is not the convex combination of any other points.

**The Fundamental Theorem of Linear Programming**

If there is an optimal solution to an LP, then there is an optimal vertex. 

Note: There could be no optimal solution/unboundedness in direction of $c$ or even no feasible point.
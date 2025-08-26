# HOMEWORK:

Install AMPL and/or ampl for python stuff. URL will be sent out. 

Reading: Vanderbei chapter 1 (intro)

# Notes

Each set $H = \{ x \in \mathbb{R}^n: a_i^Tx=b_i \}$ is a hyperplane. Were $a_i^T$ is a row of $A$. 

**Example:** Generalization of plane in $\mathbb{R}^3$

flat level set of dimension $n-1$. This is because if we know $n-1$ variables the final variable is forced. So $n-1$ variables are free to vary. 

A hyperplane induces two half spaces. The positive and negative half spaces. 

$H^+ = \{x \in \mathbb{R}^n: a_i^T x \geq b_i\}$ and $H^- = \{x \in \mathbb{R}^n: a_i^T x \leq b_i\}$ 

The normal vector $a_i \in \mathbb{R}^n$ points orthogonally into $H^+$. $H$ can be considered a level set with respect to $a_i^Tx$. 

Basically. This set up allows us to scale up into higher dimensional spaces. The notes online show a graph showing an example 2d line. 

**End example**

---

The feasible region of an LP in canonical form is the intersection of finitely many halfspaces.

**Polyhedral Sets** are finite intersection of halfspaces.
	- polyhedron 
	- polytope (bounded polyhedron). 
	- Think like a hexagon in space providing us the region to optimize over. 
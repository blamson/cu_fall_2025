These markdown notes are simply for the sake of engagement in class. The professor will also post his own notes that I will save to this directory as well.

I'll need to figure out what format I wanna do for these notes. May do .tex pdfs for access to vimtex, may just use markdown... idk yet. 

# Interesting Optimization Cases

Following from day 1... When does $Ax=b$ become interesting for optimization?

**Case 1:** $\text{rank} A < \text{rank} |Ab|$. **No solution**

**Case 2:** $\text{rank} A = \text{rank} |Ab| = n$. **One Solution**

**Case 3:** $\text{rank} A = \text{rank} |Ab| < n$. **Infinitely many Solutions**

Case 3 is really the only one that has something interesting going on. Think of this with respect to the bounds we create in a linear programming situation at work. We have a ton of solutions but we compare them with respect to an objective function. Tons of ways to organize workers w/ respect to project buckets, but not all of these are equal. 

# Standard and Canonical Forms of Linear Programs

$\min f(x)$ <- this guy is an objective function we're looking to optimize. 

$g(x) \geq 0$

$h(x) = 0$ 

$f, g, h$ are linear functions. These are a general linear program. 

Linear equation: $a_{i1} \cdot x_1 + a_{i2} \cdot x_2 + a_{in} \cdot x_n = b_i$ 

Where $a_{ij}, b_i$ are parameters and $x_i$ are variables. 

Vector notation: $c = (c_1, ..., c_n)^T$. $x = (x_1, ..., x_n)^T$. So $c^T x$ is a linear term with a scalar product.

We can transform a general linear program (LP) to simpler forms.

## Standard Form

$\min c^T x$

s.t. $Ax = b$, $x \geq 0$.

This is used for algorithms. 

## Canonical Form

$\min c^T x$ 

s.t. $Ax \leq b$ or $Ax \geq b$. So no pure equalities. 

Used for proofs and geometry. 

As a general rule for canonical form, inequalities should all point in the same direction. When doing stuff with canonical form, don't mix up the signs. 

# Tools for rewriting a linear program (LP)

- $\min c^T x = \max -c^T x = \max (-c)^T x$
	- So it is okay to always use $\min$. 

- $x$ free <=> $x = x^+ - x^-$, $X^+, x^- \geq 0$ 
	- Look up **free variables** again.
	- Any free $x$ can be written as a difference of two non-negative numbers. There are infinitely many ways to describe... 2 as a difference of two non-negative numbers for example. $3-1$, $199-197$, etc etc
		- So this is a one to many transformation which creates some problems.
		- One can write $x = (y^+ + k) - (y^- + k) \forall k$
		- In algorithms, only one of these pairs $x^+, x^-$ appears. One of them is guaranteed to be 0.

To rewrite $Ax = b$ in canonical form, we can use $Ax \leq b, Ax \geq b$. 
	- Remember though, we don't want to mix signs.
	- $Ax \leq b$ <=> $(-A)x \geq -b$
	- $Ax \leq b$ <=> $Ax + s = b, s \geq 0$
		- $s$ are slack variables. $s \in \mathbb{R}^m$

The above tools are everything you need to transform any LP into standard or canonical form. 

# HOMEWORK 1 ASSIGNMENT

Pick a small example from the AMPL book and write the corresponding LP in its original form, standard form and canonical form.

Reading AMPL intro, 1.1 and 1.2.

# The Geometry of Linear Programs

$\max 3x_1 + 2x_2$

$s.t. -x_1 + 3x_2 \leq 12$

$x_1 + x_2 \leq 8$ 

$x_1 - x_2 \leq 10$

$x_1, x_2 \geq 0$ 

Is this in canonical form? Mostly. The inequality at the bottom is different and its maximizing instead of minimizing, but those are simple to adjust. 


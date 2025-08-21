# Point Patterns at Scale

An important thing about point patterns is that scale MATTERS. As we zoom in and out of a domain we see different behavior. At one scale a grouping may look like a cluster, but if we zoom in that cluster may be a regular pattern. We can also have clusters of regular patterns or a regular pattern of clusters. 

Think of like a cluster on a map of regularly spaced locations for instance! Like clusters of equipment in farm land or something. These things can all intermingle, so its important to consider that when looking at these patterns. What scale do we care about?

How do we actually determine the type of pattern? Is there a way to mathematically represent "regularity", "complete spatial randomness", and "clustering"?

# Detecting Patterns

We detect regularity or clustering by detecting a departure from CSR. What methods do we use to detect this?

Hypothesis testing and monte carlo simulations are great tools for these assessments. 

Traditional hypothesis testing like a z test is just not realistic for spatial data due to the degree of assumptions that'd need to be made. 

## Hypothesis Tests

Spatial hypothesis tests assume:
	- the domain is assumed to be a regular shape, like a square or rectangle
	- the number of events goes to infinity

These tests are generally performed by comparing the observed value of a test statistic to its distribution under the null, as usual. 

Whats cool is we can easily simulate data under the null using monte carlo methods! So we can approximate the null and then compare to that. Shoutouts to simulation methods, oh sweet prince. Ol' reliable. 

Procedure (refer to slide 24/74)
1. Calculate test statistics denoted $T_{obs}$
2. Generate a large number $N_{\text{sim}}$ of data sets assuming CSR.
3. Calculate the test statistic for each of the $N_{\text{sim}}$ simulated data sets.
4. Count the number of test statistics (the simulated AND observed) as large or larger than the observed.
5. The estimated p-value is:
	- $\hat{Pr}[T \geq T_{obs} \; | \; H_0 \; \text{is true}] = l/(N_{\text{sim}} + 1)$
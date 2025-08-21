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
	- $\hat{Pr}[T \geq T_{obs} | H_0 \text{is true}] = l/(N_{\text{sim}} + 1)$

We add 1 to the denominator so we include the observed test statistic. 

**NOTE** Due to their reliance on simulated methods, these results aren't precisely replicable. But, in a practical sense, this doesn't really matter. 

## Heterogeneous Poisson Process

A poisson process is homogeneous when the intensity, $\lambda$, is constant across the study area. This is often too restrictive in the context of public health. Population usually isn't normally distributed across space. 

The **constant risk hypothesis (CRH)** is a competing model of "no clustering". Under CRH, each person has the same risk of disease during some obervation period, REGARDLESS of location. 
- clusters of cases in high populations are likely to violate CSR but may not violate the CRH.
- We expect more cases in high population areas. 

Check slide 27/74 for the definition of the **heterogeneous poisson process**.

Translation
- The number of events in disjoint regions still follow independent Poisson distribution.
- Component 1 means the number of events expected in an area $A$ is rellated to the average intensity over the region.
- Component 2 means the events are distributed more or less frequently related to the intensity. We expect more events in areas with higher intensity. 

This process:
	- is nonstationary since it is no longer translation invariant
	- heterogeneity results in an anisotropic process if the intensity function is anisotropic. 
	- This process CAN be isotropic in theory, but its considered unlikely. 

The intensity function is a first order (mean or average) property describing the expected density of events in any locations of the region. 

Events are independent of one another, but clusters appear in areas of high intensity. 

Under a heterogeneous poisson process, clusters occur due to heterogeneities in the intensity function. 

So really, what this gives us is a way to ask "is this number we're seeing expected due to clustering or is there something more interesting going on...". We get some baseline behavior to compare to! 
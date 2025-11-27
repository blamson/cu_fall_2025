= Exam 2 Study Guide

What is regional count data?
    - What do you need to perform spatial analysis?

What is the constant risk hypothesis?

What is the ecological fallacy? Modifiable areal unit problem? Scales of clustering that can be
detected?

CEPP, Besag-Newell, Spatial Scan methods
    - What are the test statistics
    - What are the null and alternative hypotheses for each test?
    - What conclusions can be drawn from the tests?

Choices for constructing spatial proximity matrices

Moran’s I (basic and constant risk version), Geary’s C
    - What are the test statistics?
    - What are ways of constructing a null distribution? Which are valid?
    - What conclusions can be drawn from the tests?
Tango’s method
    - Test statistic, relationship between assessing goodness-of-fit and spatial autocorrelation
    - What are the null and alternative hypotheses for this test?
    - What conclusions can be drawn from this test?
    - Methods for assessing statistical significance.
How to assess power, determine which methods are most powerful, limitations

What is geostatistical data?

What is needed to define a geostatistical data set?

Definition of second-order stationarity
    - Why is it important?

Intrinsic versus second-order stationarity

Isotropy versus anisotropy
    - Types of anisotropy

Types of anisotropy

Definition of variogram/semivariogram

How to estimate a variogram/semivariogram
    - How to do this for omnidirection and directional semivariograms (tolerance regions, angles, etc.)
How to model a variogram/semivariogram
    - What are the common models? What are some important distinctions?
    - What are the methods for fitting the model to the empirical semivariogram?
    - How to select the “best” semivariogram model
What are the components of a semivariogram?
    - What are the interpretations of these components?
What is the nugget? How does it affect continuity of the process?
How to model the covariance of a spatial process.
    - ML and REML, the likelihood function, the log likelihood function
    - How to model anisotropic covariance models
    - How to select a “best” covariance model using AIC, BIC


```
Deterministic versus probabilistic prediction
Distinctions in the various types of kriging
```

- Simple, ordinary, universal, filtered, lognormal, indicator, block, etc.
- In what regards are kriging predictors “best”
- How do the covariance matrices in the kriging equations change when you do standard versus
    filtered kriging? How will to predictions and MSPE change?
What is conditional simulation? What is it used for?




= NOTES

== Geary's C

Doesn't require knowing the mean in its computation. 

$
  (Y_i - Y_j)^2 
$

compared to 

$
  (Y_i - #overline[Y])(Y_j - #overline[Y])
$

In morans I. 

The morans I is typically used more in a practical sense due to it having more power than geary's C. 



For morans I, focus on just the CRH version. We can ignore the normality version. 

The regular morans i assumes $Y_i, ..., Y_n ~ N(mu, sigma^2)$ which is not realistic. 

== Power

We estimate the power of cluster/clustering tests by generating simulated data sets under different clustering models. 

We use benchmark datasets for different kind of situations to see what a kind of test is good or bad at. This is NOT RELATED TO A SPECIFIC PROBLEM BEING WORKED ON. These are general public datasets that are like "this dataset is for testing how well a test detects oblong cluster shapes" and such. Think LLM or ML benchmark datasets. 

== Kriging

Don't memorize all the kriging styles, ignore block.

Remember simple, ordinary, universal, log normal, indicator
- Standard vs. filtered for all of these

How do the covariance matrices change between filtered and ordinary kriging? 

#pagebreak()

== Semivariogram Models

#table(
  columns: 5,

  [*Model*], [*Finite Range?*], [*Smoothness Near 0*], [*Correlation Decay*], [*Typical Use Case*],

  [Spherical], [✅ Yes], [Moderate], [Sharp cutoff], [Soil, geology — localized effects],

  [Exponential], [❌ No], [Rough], [Fast exponential], [Environmental data, moderate smoothness],

  [Gaussian], [❌ No], [Very smooth], [Slow (squared)], [Temperature, continuous fields],

  [Matérn], [❌ No (general)], [Adjustable (ν)], [Tunable], [General-purpose, flexible modeling],
)

#image("Variogram-models.png")

== Nonlinear least squares regression vs. MLE

NLS fits to the empircal semivariogram. MLE fits to the data itself. 
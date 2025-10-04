#import "@preview/grape-suite:3.1.0": exercise
#import exercise: project, task, subtask
#show selector(heading.where(level: 2)): set heading(numbering: none)
#show selector(heading.where(level: 3)): set heading(numbering: none)
#show selector(heading.where(level: 4)): set heading(numbering: none)

#show: project.with(
    title: "Homework Collection 2",

    university: [University of Colorado, Denver],
    semester: [Fall 2025],
    seminar: [MATH 6384 - Spacial Data Analysis],

    show-outline: true,

    author: "Brady Lamson",

    show-solutions: false,
    show-lines: false,
    type: "Homework Sheet"
)

= Point Patterns

A *point* is any location where an event COULD occur.

An *event* meanwhile is a location where an event did occur.

*Point Pattern Data* consistents of a collection of observed event locations and a spatial domain of interest. 

The spatial domain of interest is super important. All results are with respect to it, different spatial domains can reach different conclusions.

== Spatial Point Processes

A *stochastic process* is a collection of random variables. 

A *spatial point process* is a stochastic process where each RV is the location of an event.

A *realization* of a SPP is a collection of locations generated under the spatial point process model. 
- This is regardless of whether we know what that model is.

= Complete Spatial Randomness

CSR is a situation where, given a spatial domain of interest, all points are equally likely to produce an event. 

Events are independent and uniformly distributed. 

== Regularity

Points are consistently spaced apart from one another, they aren't right on top of eachother. Think houses in a neighborhood. 

== Clustered and Clustering

Events are *clustered* when they occur more frequently near one another than one would expect under certain assumptions.

= Simulating CSR Data

= Spatial Density and Intensity

== Interpretation

== Estimating using Kernel Smoothing

= Monte Carlo Testing

= Case Control Point Data

= Random Labeling Hypothesis

= Log Relative Risk

= K Functions

== Difference in K Functions

= Geographical Analysis Machine

= Spatial Scan Method

= Q Nearest Neighbors

= Regional Count Data

= Constant Risk Hypothesis

= Misc Stuff
What is the ecological fallacy? Modifiable areal unit problem? Scales of clustering that can be
detected?

= CEPP, Besag-Newell, Spatial Scan methods
- What are the test statistics
- What are the null and alternative hypotheses for each test?
- What conclusions can be drawn from the tests?
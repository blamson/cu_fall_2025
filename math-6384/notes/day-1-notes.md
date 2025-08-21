# Day 1 Spatial Data Analysis Notes

3 main types of spatial data
	1. Point process data
		- Data are the locations of where events of interest occur.
		- Ex: Where fracking wells are located in Colorado.
	2. Areal data
		- Data are aggregated or summarized over regions like census tracks, zip codes, counties, etc.
		- Usually for anonymity
	3. Geostatistical data
		- data are measurements observed over a continuous space.
		- we're trying to predict what happens in between. 

# Point Pattern data

All about the clustering/locations of events. Think about a disease outbreak and seeing patterns in people with a disease. 

For point pattern data you need two things.
	1. Observed event locations.
	2. Spatial domain of interest. 

\#2 here is very important. All analysis is done within certain bounds or a given context. Think about looking at tornado locations within the US. We can see clear tornado patterns along tornado valley. However, what about the trends WITHIN tornado valley. It's like zooming in on a scatterplot, it changes interpretation. 

For some terms.

CSR is complete spatial randomness. Clustering is... clustering. Regularity is about points being equidistant from each other. Its kinda a spectrum.

<[a]---[b]---[c]>

a: More clustered.
b: CSR
c: More regular. 

# IID Data
Does NOT exist in spatial data. We never make this assumption like we would in traditional statistical inference. 

What assumptions do we make then? 
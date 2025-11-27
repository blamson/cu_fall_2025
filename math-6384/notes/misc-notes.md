# Kriging

What happens when we force it to extrapolate?

Our predictions shrink towards the mean. Why does this happen? It's all due to autocorrelation. Think about it, we assume points close together are more similar. As we get further and further away the correlation between points goes to 0. Think of the semi variogram plot and how it plateaus at a certain distance. From this the model will end up just predicting... the mean. There's just no information to cause a deviation away from it. 

So if you use colorado temperature data to predcit the temperature in nigeria, the model will just predict the mean colorado temperature. 

I kinda want to test this out. 

# SAR Model $cov(y)$

Apparently how a lot of modern spatial books derive this is just wrong. 
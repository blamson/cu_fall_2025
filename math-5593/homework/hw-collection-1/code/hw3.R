library(utils) # for combn
A = matrix(c(1,2,3,0,1,1,1,1), nrow=2, byrow=T)
b <- matrix(c(6,4))
cols <- 1:4
cmb <- combn(cols, 2, simplify = FALSE)

results <- lapply(cmb, function(idx){
    B <- A[, idx]
    if (abs(det(B)) < 1e-10) return(list(basis=idx, feasible=NA, sol=NA, note="singular"))
    sol <- solve(B, b)
    feasible <- all(sol >= -1e-10) # allow tiny numerical tolerance
    list(basis=idx, feasible=feasible, sol=sol)
})

# Print nicely
for (r in results) {
    cat("basis columns:", paste(r$basis, collapse=","), "\n")
    if (is.character(r$sol)) cat("  ", r$note, "\n") else {
        cat("  basic solution:", paste(round(r$sol,6), collapse=", "), "\n")
        cat("  feasible (all >=0)?", r$feasible, "\n")
    }
}

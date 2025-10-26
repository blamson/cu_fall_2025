from amplpy import AMPL
from loguru import logger
import os

def main():
    logger.info("Initializing solver")
    ampl = AMPL()
    alldiff = True
    if alldiff:
        ampl.setOption("solver", "scip-cpx")
        model_path = "sudoku-alldiff"
    else:
        ampl.setOption("solver", "highs")
        model_path = "sudoku"

    homework_path = "homework/hw-collection-3"
    ampl.read(f"{homework_path}/models/{model_path}.mod")
    ampl.read_data(f"{homework_path}/data/sudoku.dat")
    
    logging = True

    logger.info("Running solution")
    ampl.solve()
    if logging:
        ampl.eval("display grid_data;")
        ampl.eval("display FIXED;")
        ampl.eval("display MODIFIABLE;")
        if not alldiff:
            ampl.eval("display {i in 1..gridsize, j in 1..gridsize} X[i,j,1];")
    sol = ampl.getVariable("X")
    
    if not alldiff:
        sol_grid = [[0]*9 for _ in range(9)]

        # Translate from one hot encoding to actual values
        # Iterate through row, column, value slice to identify which whindow has a 1
        for i in range(1, 10):
            for j in range(1, 10):
                for v in range(1, 10):
                    if sol[i,j,v].value() == 1:
                        sol_grid[i-1][j-1] = v

        for row in sol_grid:
            print(row)
    
    else:
        ampl.eval("display X;")

if __name__ == "__main__":
    main()

from amplpy import AMPL
from loguru import logger
import os

def main():
    logger.info("Initializing solver")
    ampl = AMPL()
    ampl.setOption("solver", "highs")

    file_name = "knapsack"
    part = "f"
    homework_path = "homework/hw-collection-2"
    ampl.read(f"{homework_path}/models/knapsack/knapsack-{part}.mod")
    part = "a"
    ampl.read_data(f"{homework_path}/data/knapsack/knapsack-{part}.dat")

    logger.info("Running solution")
    ampl.solve()
    
    ampl.eval("display Total_Value;")
    ampl.eval("display Use, value, weight;")

if __name__ == "__main__":
    main()

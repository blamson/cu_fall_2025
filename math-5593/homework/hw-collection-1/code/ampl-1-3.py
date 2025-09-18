from amplpy import AMPL
from loguru import logger
import sys

def main():
    logger.info("Initializing solver")
    ampl = AMPL()
    ampl.setOption("solver", "highs")

    file_name = "steel3"
    logger.info("Reading data")
    ampl.read(f"../models/{file_name}.mod")
    ampl.read_data(f"../data/{file_name}.dat")

    logger.info("Running solution")
    ampl.solve()
    ampl.eval("display Time, Make.val, Make.rc;")

if __name__ == "__main__":
    main()

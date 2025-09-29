from amplpy import AMPL
from loguru import logger
import os

def main():
    current_directory = os.getcwd()
    print(f"The current working directory is: {current_directory}")
    
    logger.info("Initializing solver")
    ampl = AMPL()
    ampl.setOption("solver", "highs")

    file_name = "steel/steel3"
    path = "homework/homework-collection-1"
    logger.info("Reading data")
    ampl.read(f"{path}/models/{file_name}.mod")
    ampl.read_data(f"{path}/data/{file_name}.dat")

    logger.info("Running solution")
    ampl.solve()
    ampl.eval("display Time, Make.val, Make.rc;")

if __name__ == "__main__":
    main()

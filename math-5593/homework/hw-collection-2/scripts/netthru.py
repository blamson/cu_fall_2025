from amplpy import AMPL, Environment
from loguru import logger
import os

def main():
    logger.info("Initializing solver")
    ampl = AMPL()
    ampl.setOption("solver", "highs")

    file_name = "netthru"
    homework_path = "homework/hw-collection-2"
    ampl.read(f"{homework_path}/models/{file_name}.mod")
    ampl.read_data(f"{homework_path}/data/{file_name}.dat")

    logger.info("Running solution")
    ampl.solve()
    
    ampl.eval("display LINKS;")
    ampl.eval("display Balance;")

if __name__ == "__main__":
    main()

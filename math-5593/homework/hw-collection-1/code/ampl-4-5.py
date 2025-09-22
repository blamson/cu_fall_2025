from amplpy import AMPL
from loguru import logger

def main():

    logger.info("Initializing solver")
    ampl = AMPL()
    ampl.setOption("solver", "highs")

    path = "steelT/steelTb"
    # scenario = "scenario1"
    logger.info("Reading data")
    ampl.read(f"../models/{path}.mod")
    ampl.read_data(f"../data/{path}.dat")

    logger.info("Running solution")
    ampl.solve()
    ampl.eval("display Expected_Profit;")
    ampl.eval("option display_1col 0;")
    ampl.eval("display Make;")
    ampl.eval("display Sell;")

    make = ampl.getVariable("Make").get_values().to_list()
    print(make)

if __name__ == "__main__":
    main()
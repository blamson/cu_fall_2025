from amplpy import AMPL
from loguru import logger

def main():
    logger.info("Initializing solver")
    ampl = AMPL()
    ampl.setOption("solver", "highs")

    file_name = "steel4"
    logger.info("Reading data")
    ampl.read(f"../models/steel/{file_name}c.mod")
    ampl.read_data(f"../data/steel/{file_name}b.dat")

    logger.info("Running solution")
    ampl.solve()

    logger.info("Printing Results")

    total_profit = round(ampl.getObjective("Total_Weight").value(),2)
    print("\nTotal Weight:", total_profit)

    make_vals = {
        product: value
        for product, value in ampl.getVariable("Make").get_values().to_list()
    }

    print("\nTons produced per product ---")
    [print(f"{product}: {round(tons, 2)}") for product, tons in make_vals.items()]

    # Compute hours used per stage
    time_used = {}
    for stage in ampl.getSet("STAGE"):
        hours = sum(
            make_vals[product] / ampl.getParameter("rate")[product, stage]
            for product in ampl.getSet("PROD")
        )
        time_used[stage] = hours

    print("\nTime taken per stage ---")
    [print(f"{stage}: {round(hours, 2)}") for stage, hours in time_used.items()]

    rate_param = ampl.getParameter("rate").get_values().to_list()
    print("\nFinishing Stage Rates ---")
    for x in rate_param:
        if x[1] == 'finishing':
            print(f"{x[0]}: {x[2]}")

if __name__ == "__main__":
    main()


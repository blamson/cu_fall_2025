from amplpy import AMPL

def main():
    print("Starting example")
    ampl = AMPL()
    ampl.setOption("solver", "highs")

    ampl.read("../models/steel4.mod")
    ampl.read_data("../data/steel4.dat")

    ampl.solve()

    var_make = ampl.getVariable("Make")
    make_vals = {product: value for product, value in var_make.get_values().to_list()}

    # Compute hours used per stage
    time_used = {}
    for stage in ampl.getSet("STAGE"):
        hours = sum(
            make_vals[product] / ampl.getParameter("rate")[product, stage]
            for product in ampl.getSet("PROD")
        )
        time_used[stage] = hours

    print("\nTime taken per stage")
    for stage, hours in time_used.items():
        print(f"{stage}: {round(hours, 2)}")


if __name__ == "__main__":
    main()


from amplpy import AMPL

def main():
    ampl = AMPL()
    ampl.setOption("solver", "highs")

    ampl.read("../models/steel.mod")
    ampl.read_data("../data/steel.dat")

    ampl.solve()
    print("Objective value:", ampl.getObjective("Total_Profit").value())
    print("Print variable values ---")
    myvar = ampl.getVariable("Make")
    for x, y in myvar:
        print(f"{x[0]}: {y.value()}")

    print("Alternative variable extraction? ---")
    print(ampl.getVariable("Make").get_values().to_list())

if __name__ == "__main__":
    main()


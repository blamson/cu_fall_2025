# This file simply exists to ensure the project has been set up correctly.

from amplpy import AMPL

def main():
    ampl = AMPL()
    ampl.setOption("solver", "highs")

    # Define LP model
    ampl.eval(r"""
        set PRODUCTS;
        param profit {PRODUCTS};
        var x {p in PRODUCTS} >= 0;
        maximize Total_Profit: sum {p in PRODUCTS} profit[p] * x[p];
        subject to Limit {p in PRODUCTS}: x[p] <= 5;
    """)

    # Supply data — **quotes around set members**
    ampl.eval(r"""
        let PRODUCTS := {'A', 'B'};
        let profit['A'] := 3;
        let profit['B'] := 5;
    """)

    # Solve
    ampl.solve()

    # Print results
    print("Objective value:", ampl.getObjective("Total_Profit").value())
    for name, values in ampl.getVariables():
        print(f"Name: {name}, Values: {values}")

if __name__ == "__main__":
    main()


from amplpy import AMPL
from loguru import logger
import os

def main():
    logger.info("Initializing solver")
    ampl = AMPL()
    ampl.setOption("solver", "highs")

    file_name = "napkins"
    homework_path = "homework/hw-collection-2"
    ampl.read(f"{homework_path}/models/{file_name}-network.mod")
    ampl.read_data(f"{homework_path}/data/{file_name}.dat")

    logger.info("Running solution")
    try: 
        ampl.solve()
        
        network = True
        ampl.eval("display Total_Cost;")
        ampl.eval("display Available;")
        ampl.eval("display demand, Buy, Used;")#, Carry;")
        
        if network:
            ampl.eval("display FastLaundry, SlowLaundry, TrashFlow;")
        else:
            ampl.eval("display HandlingInventory;")
            ampl.eval("display Wash2, Wash4, Trash;")
    except Exception as e:
        print(f"AMPL ERROR: {e}")
        ampl.eval("display Available, Used;")
        #ampl.eval("display Demand, Carry, Buy;")
        # ampl.eval("display Stock, InitialNapkins;")
    

    

if __name__ == "__main__":
    main()

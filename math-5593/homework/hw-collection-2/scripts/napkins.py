from amplpy import AMPL
from loguru import logger

def main():
    logger.info("Initializing solver")
    ampl = AMPL()
    ampl.setOption("solver", "highs")

    network = False
    file_name = "napkins"
    homework_path = "homework/hw-collection-2"
    model_path = f"{homework_path}/models/{file_name}"
    if network:
        model_path = f"{model_path}-network"
    ampl.read(f"{model_path}.mod")
    ampl.read_data(f"{homework_path}/data/{file_name}.dat")

    logger.info("Running solution")
    try: 
        ampl.solve()
        
        ampl.eval("display Total_Cost;")
        
        if network:
            ampl.eval("display demand, Buy, Carry, FastLaundry, SlowLaundry, TrashFlow;")
        else:
            ampl.eval("display demand, Buy, Carry, Wash2, Wash4, Trash;")
    except Exception as e:
        print(f"AMPL ERROR: {e}")
    

    

if __name__ == "__main__":
    main()

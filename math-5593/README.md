# Overview

This readme will contain a variety of info that will be niche and easily forgettable. Mostly environment info, AMPL stuff, that kinda thing.

# Poetry Basics

Cause I always forget!

- `poetry env info` is a great way to get a reminder of an old poetry environment. 
- `poetry env activate` allows you to activate an environment. Newer version of `poetry shell`. This is important for installing stuff onto the environment, like AMPL solvers. 
- `poetry add` for getting new libraries.
- `poetry update` to update all libraries in the venv.

## PyCharm

PyCharm can be moody with poetry but they do get along once set up. The big thing is just the interpreter really. 
Assuming it isn't configured in PyCharm:
1. Navigate to settings
2. Navigate to interpreter settings
3. Add interpreter -> local interpreter
4. Select existing. Use a Python environment, NOT poetry.
    1. This seems weird but its cause the environment is already set up. It'll know to use the poetry environment, don't worry.
5. Specify the path to the python interpreter at `math-5593/.venv/bin/python`.

You should be in the clear. For any weird inconsistencies such as stuff working in terminal but not pycharm, make sure you actually modified the venv. It can be easy to install AMPL models outside the venv by not using `poetry env activate`.


# AMPL Information

[General website link](https://portal.ampl.com/user/ampl/home)

[Python API](https://amplpy.ampl.com/en/latest/)

[Textbook datasets/models](https://dev.ampl.com/ampl/books/ampl/examples/index.html)

## Setup

For this course I have access to a student code. This will eventually be lost to the void but for setting it up:

```commandline
# Activate poetry environment
poetry env activate

# Install Python API for AMPL:
$ poetry run python -m pip install amplpy --upgrade

# Install solver modules:
$ poetry run python -m amplpy.modules install highs gurobi

# Activate your license (e.g., free ampl.com/ce or ampl.com/courses licenses):
$ poetry run python -m amplpy.modules activate <MY-CODE-HERE>
```

The following commands can be used with `amplpy.modules`:
- install 
  - Install new solvers. `highs` and `gurobi` here are common solvers so are included in this code.
- uninstall
- list/installed
- available 
  - What solvers are available to install.
  - Good way to sanity check a successful activation.
- requirements
- path
- run
- activate
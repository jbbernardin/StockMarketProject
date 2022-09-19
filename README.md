# StockMarketProject
Given that you are betting in favor, how much of your capital should you be betting? This includes a UI and algorithm.

Note that the .m file runs with no issue so long as the most recent version of matlab is downloaded. However, running
the .py file requires extra steps. 

Line 1 which has import matlab.engine will likely throw an error since it will likely not recognize that package. To
correctly import the package one must do the following on your terminal:

1. Type cd [matlab_root_directory]/extern/engines/python
2. Type sudo python setup.py install

If you do this, then if you type

pip list | grep matlab

you should see

matlabengineforpython   [matlab version]


The final note to make about running the .py file is that the .m file must be within the same scope as the .py file,
i.e. both must be in the same directory in order to run the file.

Overall if you are still running into issues running the proof of concept please only run the .m file.

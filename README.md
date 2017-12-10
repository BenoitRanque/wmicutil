# Wmic Util

#### Easily get system info using the wmic util

This utility will write system info to a csv file


#### Basic use guide
Download all files.

Config fields in `wmicutil.cfg`

Double click `wmicutil.bat` to run program.

View results in `wmicutil.csv`


## Files
### wmicutil.bat
This file starts the powershell script  with administrator privileges. Simple double click on most machines
Does nothing else.


### wmicutil.ps1
Powershell script. All logic goes here
At the top of the file, you can edit the names of the config and output files
You can also enable/disable an aditional coment field here


### wmicutil.cfg
Configure your required fields in this file.
Note: not all have been tested

### wmicutil.csv
Standard csv output file, can easely be opened in excel
This file is created if it does not exist, else it is appended to

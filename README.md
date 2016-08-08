Malden River: Exploratory Water Quality Data Analysis
===========================================================

*prepared for*

**[Mystic River Watershed Association (MyRWA)](http://mysticriver.org/)**

*by*

**Jeffrey D Walker, PhD**   
**[Walker Environmental Research, LLC](http://walkerenvres.com)**  
[@walkerjeffd](https://github.com/walkerjeffd)

August 5, 2016

---------------------------------------------------------

## About

This repo contains the source code for the report titled "Malden River: Exploratory Water Quality Data Analysis." 

The report provides an exploratory analysis of water quality data from the Malden River, which is a highly urbanized river located near Boston, MA and is a major tributary to the Mystic River. 

The data sets were collected by the [Mystic River Watershed Association (MyRWA)](http://mysticriver.org) and [Massachusetts Water Resources Authority (MWRA)](http://www.mwra.com/).

Sampling was performed at biweekly and monthly frequencies from 2000 through 2015. Sample parameters include standard field measurements (DO, Temp, Sp Cond), nutrients (TP), algal biomass (Chl-a), and indicator bacteria (E. coli, Enterococcus).

This report was written using [RStudio](https://www.rstudio.com/) with the [rmarkdown package](http://rmarkdown.rstudio.com/) package. All data and code necessary to reproduce the report can be found in this repository.

----------------------------------------------------------

## Generate the Report

To reproduce this report, start with the `main.R` script and run each line that is uncommented. These scripts will run the `load-*` scripts, which read in the data from the `data/db` and `data/gis` folders, and save the results as binary R files in `data/rdata`.

If you get an error about some packages not being installed, then check the `packages.R` script, and install any packages listed in `packages` that are missing. 

Next, open `rmd/malden-eda.Rmd` in RStudio and click "Knit PDF" button. 

If all works as expected, you should then have a pdf of the report saved to `rmd/malden-eda.pdf`.

**Adjusting Figure Location in Text**

By default, the figures in the report will be placed using a "floating" layout, meaning they could be moved to a location different from where they are defined in teh source code. To force the figures to appear in their defined location within the text:

- Open the `rmd/malden-epa.tex` file after knitting `rmd/malden-epa.Rmd`.
- Run a find and replace of `htbp` -> `H`.

This will change all instances of `\begin{figure}[htbp]` to `\begin{figure}[H]`, which forces each figure to its assigned position in the text. In other words, the figures won't float any more.


**Updating the Water Quality and Precipitation Datasets**

The data sets are stored in the `data/db` folder as CSV files. These files are static snapshots extracted from the Mystic River Water Quality Access Database, and the hourly Precipitation spreadsheet for Logan Airport.  To extract a new snapshot of these datasets, run the scripts `load-db-wq.R` and `load-db-precip.R`. 

*NOTE*: these scripts will overwrite the CSV files that came with the repo. Also note that these scripts require running R in 32-bit mode on Windows only (requirements of `RODBC` package), and installation of the [myrwaR](http://walkerjeffd.github.io/myrwaR/) package.



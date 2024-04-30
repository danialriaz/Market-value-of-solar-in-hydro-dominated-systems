# "The Market Value of Solar in Hydro dominated systems"

This repository contains the code and manuscript accompanying the paper "The Market Value of Solar in Hydro dominated systems".

## Abstract

With the cost of wind and solar rapidly decreasing (and in many cases comparable to conventional thermal technology), policy makers are increasingly concerned about the value of Variable Renewable Energy (VRE). Greater integration of VRE into the energy mix has an impact of cannibalizing its own revenues. This paper examines the extent to which the reliance on hydro-power (non-VRE) can mitigate this value depressing phenomenon of VRE. 
Hydropower meets the majority of electricity demand in 28 emerging and developing economies ((IEA), July 2021). Understanding how hydro supports VRE can help in a better sustainable energy transition in these economies. Specifically, I evaluate the impact on the Market Value of Solar with increased expansion, in thermal dominated systems (Germany) vs hydro dominated systems (Sweden) using numerical modelling following the example of [(Hirth,2016)](https://neon.energy/Hirth-2016-Market-Value-Flexibility-Wind-Hydropower.pdf)


## Repository Structure

This repository is branched from the PyPSA-Eur's main repository. It should be used along with Supplementary code provided [here](https://github.com/danialriaz/Supplementary-material---thesis). 
- `configs` contains configuration files for PyPSA-Eur for different scenarios.
- `output files` contains the `.nc` network outputs that were used to extract the data.
- `rules` and 'scripts' have been modified based on the scenarios conducted. The author's additions are marked with #DR
- `analytical files` contains the Jupyter notebooks used for the evaluation of results.
- data used for this model can be retrieved from [here](https://zenodo.org/records/7647522)

## Installation and Usage

Clone the repository including its submodules:

```sh
git clone --recurse-submodules git@github.com:danialriaz/Market-Value-of-Solar
```

Install the necessary dependencies using `conda` or `mamba`:

```sh
mamba env create -f workflows/pypsa-eur/envs/environment.yaml
```

Navigate into the main Snakemake workflow directory of PyPSA-Eur-Sec:

```sh
cd workflows/pypsa-eur-sec
```

To run the scenarios of a particular configuration file (e.g. `configs/config.main.yaml`), run:

```sh
snakemake -call --configfile ../../configs/config.main.yaml plot_summary
```

This call requires a high-performance computing environment.

Please follow the documentation of [PyPSA-Eur](https://pypsa-eur.readthedocs.io) for more details.

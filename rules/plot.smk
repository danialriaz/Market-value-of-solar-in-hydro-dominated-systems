# SPDX-FileCopyrightText: 2023- The PyPSA-Eur Authors
#
# SPDX-License-Identifier: MIT

rule plot_power_network_unclustered:
    input:
        network=RESOURCES + "networks/elec.nc",
        rc="matplotlibrc",
    output:
        multiext(RESOURCES + "graphics/power-network-unclustered", ".png", ".pdf")
    script:
        "../scripts/plot_power_network_unclustered.py"


rule plot_gas_network_unclustered:
    input:
        gas_network=RESOURCES + "gas_network.csv",
        gem=HTTP.remote(
            "https://globalenergymonitor.org/wp-content/uploads/2023/07/Europe-Gas-Tracker-2023-03-v3.xlsx",
            keep_local=True,
        ),
        entry="data/gas_network/scigrid-gas/data/IGGIELGN_BorderPoints.geojson",
        storage="data/gas_network/scigrid-gas/data/IGGIELGN_Storages.geojson",
        rc="matplotlibrc",
    output:
        multiext(RESOURCES + "graphics/gas-network-unclustered", ".png", ".pdf")
    script:
        "../scripts/plot_gas_network_unclustered.py"


rule plot_power_network_clustered:
    input:
        network=RESOURCES + "networks/elec_s_{clusters}.nc",
        regions_onshore=RESOURCES + "regions_onshore_elec_s_{clusters}.geojson",
        rc="matplotlibrc",
    output:
        multiext(RESOURCES + "graphics/power-network-{clusters}", ".png", ".pdf")
    script:
        "../scripts/plot_power_network_clustered.py"


rule plot_renewable_potential_unclustered:
    input:
        regions_onshore=RESOURCES + "regions_onshore.geojson",
        regions_offshore=RESOURCES + "regions_offshore.geojson",
        **{
            f"profile_{tech}": RESOURCES + f"profile_{tech}.nc"
            for tech in config["electricity"]["renewable_carriers"]
        },
        rc="matplotlibrc",
    output:
        wind=multiext(RESOURCES + "graphics/wind-energy-density", ".png", ".pdf"),
        solar=multiext(RESOURCES + "graphics/solar-energy-density", ".png", ".pdf"),
    script:
        "../scripts/plot_renewable_potential_unclustered.py"
# script for plotting results of aimspice simulations

import matplotlib.pyplot as plt
import numpy as np

# FILE PATH TO CSV FILE
DATA_FILE_PATH = ""

# CONSTANTS
VDD = 0.6
PERIOD = 10e-9
GRAPH_SHIFT = 0.1

# GET DATA FROM FILE
data = np.genfromtxt(
    DATA_FILE_PATH,
    delimiter=",",
)

# GET TIME AXIS
TIME = [row[0] for row in data]

yticks = []
SIGNAL_NAMES = ["CLK", "EN", "IN", "OUT", "RESET"]

# PLOT SIGNALS
for i in range(1, len(data[0])):
    shift = (VDD + GRAPH_SHIFT) * i
    yticks.append(VDD / 2 - shift)

    signal = [row[i] - shift for row in data]
    plt.plot(TIME, signal)

# GET NUMBER OF CLOCK PERIODS IN PLOT
TIME_MAX = max(TIME)
CLOCK_PERIODS = round(TIME_MAX / PERIOD)

# CLOCK RISING EDGE MARKERS
for i in range(CLOCK_PERIODS):
    plt.axvline(x=(i * PERIOD), color="gray", alpha=0.5, linestyle="--")

# SET AXIS LABELS
plt.yticks(yticks, SIGNAL_NAMES)
plt.xticks(
    [period * PERIOD for period in range(CLOCK_PERIODS)],
    [f"{period}" for period in range(CLOCK_PERIODS)],
)

plt.title(
    "ONE-BIT-REGISTER : " + r"$T_{CLK}$" + f" = {PERIOD}s" + " : "
    r"$Vdd$" + f" = {VDD}V" + " : SS"
)
plt.xlabel("Clock rising edge")

plt.show()

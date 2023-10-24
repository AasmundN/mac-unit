import matplotlib.pyplot as plt
import numpy as np

# FILE PATH TO CSV FILE
DATA_FILE_PATH = ""

# GET DATA FROM FILE
data = np.genfromtxt(
    DATA_FILE_PATH,
    delimiter=",",
)

TIME = [row[0] * 1e9 for row in data]
CURRENT = [row[1] * 1e9 for row in data]

avg = round(sum(CURRENT) / len(CURRENT), 2)

plt.plot(TIME, CURRENT)

plt.axhline(y=avg, linestyle="--", color="red")
plt.axhline(y=0, color="gray", alpha=0.5)

plt.title("Leakage current, T = 27°C, Corner = TT")

plt.ylabel("Current [nA]")
plt.xlabel("Time [ns]")

plt.text(0, max(CURRENT) - 2.5, f"Average = {avg}nA")

plt.show()

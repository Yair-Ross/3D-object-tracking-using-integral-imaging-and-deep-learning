import numpy as np
class Object:
    def __init__(self, name, AGMR, max_peak, Recframe):
        self.name = name
        self.AGMR = AGMR
        self.max_peak = max_peak
        self.Recframe = Recframe
f = np.zeros([1,5])
x = Object("car", f, 5, f)
print(x.AGMR.shape)

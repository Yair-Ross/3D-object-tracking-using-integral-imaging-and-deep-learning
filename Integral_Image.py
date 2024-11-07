import math
import numpy as np
import scipy.ndimage
from scipy.signal import find_peaks
import scipy.ndimage
import cv2


def sensetivity1(F, deltax, deltay, lensx, lensy, PixelSize, M):
    rows = len(F)
    columns = len(F[0])
    X = rows
    Y = columns
    S = np.zeros((X, Y))
    F2 = np.ones((X, Y))

    for k in range(0, int(lensx)):
        for l in range(0, int(lensy)):
            S[math.floor(k * deltax / PixelSize * M): X] [math.floor(l * deltay / PixelSize * M): Y] = S[math.floor(k * deltax / PixelSize * M): X][math.floor(l * deltay / PixelSize * M):Y] + F2[math.floor(k * deltax / PixelSize * M) : X]  [math.floor(l * deltay / PixelSize * M): Y]

    return [S]
def back_proj(EI, G, deltax, deltay, lensx, lensy, PixelSize, M):
    rows = len(EI)
    columns = len(EI[0])
    fx = rows
    fy = columns
    F = np.zeros((fx, fy), dtype=float)

    for k in range(0, int(lensx)):
        for l in range(0, int(lensy)):
            x2 = (1 + k) * fx - math.floor(k * deltax / PixelSize * M)
            y2 = (l + 1) * fy - math.floor(l * deltay / PixelSize * M)
            F[math.floor(k * deltax / PixelSize * M): fx, math.floor(l * deltay / PixelSize * M): fy] = F[math.floor(k * deltax / PixelSize * M): fx, math.floor(l * deltay / PixelSize * M): fy] + G[k * fx:x2, (l * fy):y2]
    return [F]

def resolution(zg, L, pitch, zmin, zmax):
    R = np.zeros((zmax,), dtype=float)
    pixelsize = 0.01
    for z in range(zmin, zmax):
        R[z] = abs(math.floor(pitch * zg / (pixelsize * z)) - math.floor(L * pitch * zg / (pixelsize * z)))
    r = abs(np.diff(R))
    dist = np.array(np.nonzero(r))
    return [dist]

def gkern(l=3, sig=1.):
    ax = np.linspace(-(l - 1) / 2., (l - 1) / 2., l)
    xx, yy = np.meshgrid(ax, ax)
    kernel = np.exp(-0.5 * (np.square(xx) + np.square(yy)) / np.square(sig))
    return kernel / np.sum(kernel)


def AGMR(G, zg, lensx, lensy, zmin, zmax, EI, deltax, deltay, PixelSize, fx, fy):
    L = 10
    z = resolution(zg, L, deltax, zmin, zmax)
    z = np.array(z)
    z = z.flat
    z2 = np.size(z)
    point = np.zeros(z2)
    h = gkern(l=3, sig=1.)
    for i in range(0, z2):
        M = zg / z[i]
        F = back_proj(EI, G, deltax, deltay, lensx, lensy, PixelSize, M)
        S = sensetivity1(EI, deltax, deltay, lensx, lensy, PixelSize, M)
        F = np.array(F)
        S = np.array(S)
        f = F / S[0, :, :]
        f = np.uint8(f)
        f = scipy.ndimage.filters.convolve(f[0, :, :], h, mode='constant')
        grad_x = cv2.Sobel(f, cv2.CV_64F, 1, 0, ksize=3)
        grad_y = cv2.Sobel(f, cv2.CV_64F, 0, 1, ksize=3)
        abs_grad_x = cv2.convertScaleAbs(grad_x)
        abs_grad_y = cv2.convertScaleAbs(grad_y)
        grad = cv2.addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0)
        AGMR = np.mean(grad)
        point[i] = AGMR
    locs, _ = find_peaks(point, height=0)
    Zpeaks = z[locs]
    return [z, point, Zpeaks]

def ReconstructedImage(Zpeak, G, EI, deltax, deltay, lensx, lensy, PixelSize, zg, h):
    distance = []
    Int_Img = []
    for i in range(0, len(Zpeak)):
        M = zg / Zpeak[i]
        F = back_proj(EI, G, deltax, deltay, lensx, lensy, PixelSize, M)
        S = sensetivity1(EI, deltax, deltay, lensx, lensy, PixelSize, M)
        F = np.array(F)
        S = np.array(S)
        f = F / S[0, :, :]
        f = np.uint8(f)
        f = scipy.ndimage.filters.convolve(f[0, :, :], h, mode='constant')
        distance.append(f"{str(Zpeak[i])}")
        Int_Img.append(f)
        #plt.figure(i)
        #plt.imshow(f, cmap="gray")
        #plt.title()
        #plt.show()

    return [distance, Int_Img]



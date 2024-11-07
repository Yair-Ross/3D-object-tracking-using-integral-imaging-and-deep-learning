
import cv2
from PIL import Image
import scipy.ndimage
from scipy.signal import find_peaks
from scipy.signal import chirp, find_peaks, peak_widths
from scipy.signal import find_peaks, peak_prominences
from skimage import color
from skimage import io
from scipy.interpolate import make_interp_spline
from skimage.color import rgb2hsv
import matplotlib.pyplot as plt
import numpy as np
import math
from skimage import color
from skimage import io
from scipy.interpolate import make_interp_spline
from skimage.color import rgb2hsv


def sensetivity1(F, deltax, deltay, lensx, lensy, PixelSize, M):
    """The sensetivity1 function are wighted every pixel in for the reconstruction."""
    rows = len(F)
    columns = len(F[0])
    X = rows
    Y = columns
    S = np.zeros((X, Y))
    F2 = np.ones((X, Y))
    for k in range(0, int(lensx)):
        for l in range(0, int(lensy)):
            S[math.floor(k * deltax / PixelSize * M): X, math.floor(l * deltay / PixelSize * M): Y] = S[math.floor(
                k * deltax / PixelSize * M): X, math.floor(l * deltay / PixelSize * M):Y] + F2[math.floor(
                k * deltax / PixelSize * M): X, math.floor(l * deltay / PixelSize * M): Y]
    S = np.array(S)
    return S


def back_proj(EI, G, deltax, deltay, lensx, lensy, PixelSize, M):
    """This function calculate the reconstructed frame for any given Elemental videos frame."""
    """EI- elemental frame, G - Elemental videos frame
     deltay and deltax are the distance between a pair of adjacent cameras in the camera array in x and y direction
     lensx and lensy  are the number of cameras in etch direction 
      PixelSize is the pixel size of camera's sensor
      M is the magnification factor"""
    fx = len(EI)  # rows
    fy = len(EI[0])  # columns
    F = np.zeros((fx, fy), dtype=int)
    for k in range(0, int(lensx)):
        for l in range(0, int(lensy)):
            x2 = (1 + k) * fx - math.floor(k * deltax / PixelSize * M)
            y2 = (l + 1) * fy - math.floor(l * deltay / PixelSize * M)
            F[math.floor(k * deltax / PixelSize * M): fx, math.floor(l * deltay / PixelSize * M): fy] = F[math.floor(
                k * deltax / PixelSize * M): fx, math.floor(l * deltay / PixelSize * M): fy] + G[(k * fx):x2,
                                                                                               (l * fy):y2]

    return [F]


def resolution(zg, L, pitch, zmin, zmax):
    """This function return depth vector contain all the distances for calculation the reconstructed frame."""
    """"zg - the distance between the camera lens and the sensor (in [mm]).
     zmin and zmax are the the minimum and the maximum distance of field of view 
      pitch is the distance between a pair of adjacent cameras in the camera array (in [mm])"""
    R = np.zeros((zmax,), dtype=int)
    # R = np.zeros((1, zmax - zmin + 1), dtype=float);
    pixelsize = 0.01
    for z in range(zmin, zmax):
        R[z] = abs(math.floor(pitch * zg / (pixelsize * z)) - math.floor(L * pitch * zg / (pixelsize * z)))
    r = abs(np.diff(R))
    dist = np.array(np.nonzero(r))
    return [dist]


def gkern(l=3, sig=1.):
    """gaussian filter for image enhancement"""
    ax = np.linspace(-(l - 1) / 2., (l - 1) / 2., l)
    xx, yy = np.meshgrid(ax, ax)
    kernel = np.exp(-0.5 * (np.square(xx) + np.square(yy)) / np.square(sig))
    return kernel / np.sum(kernel)


def AGMR(G, zg, lensx, lensy, zmin, zmax, EI, deltax, deltay, PixelSize, fx, fy):
    L = 7
    z = resolution(zg, L, deltax, zmin, zmax)
    z = np.array(z)
    z = z.flat
    Agmr = np.zeros(len(z))
    h = gkern(l=3, sig=1.)
    for i in range(0, len(z)):
        M = zg / z[i]
        F = back_proj(EI, G, deltax, deltay, lensx, lensy, PixelSize, M)
        S = sensetivity1(EI, deltax, deltay, lensx, lensy, PixelSize, M)
        F = np.array(F)
        S = np.array(S)
        f = F / S
        f = np.uint8(f)
        f = scipy.ndimage.filters.convolve(f[0, :, :], h, mode='constant')
        # plt.imshow(f,cmap=plt.cm.gray)
        # plt.show()
        grad_x = cv2.Sobel(f, cv2.CV_64F, 1, 0, ksize=1)
        grad_y = cv2.Sobel(f, cv2.CV_64F, 0, 1, ksize=1)
        abs_grad_x = cv2.convertScaleAbs(grad_x)
        abs_grad_y = cv2.convertScaleAbs(grad_y)
        grad = cv2.addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0)
        # grad = cv2.Canny(image=f, threshold1=30, threshold2=120)
        #plt.imshow(grad, cmap=plt.cm.gray)
        #plt.show()
        AGMR_ave = np.mean(grad)
        Agmr[i] = AGMR_ave
    locs, val_max = find_peaks(Agmr, height=0)
    v = np.array(list(val_max.items()))
    val_max = np.array(v[0, 1], dtype=np.float)
    Zpeaks = z[locs]
    return [z, Agmr, Zpeaks, val_max]


def Obj_location(z, Agmr):
    locs, val_peaks = find_peaks(Agmr, height=0)
    v = np.array(list(val_peaks.items()))
    val_peaks = np.array(v[0, 1], dtype=np.float)
    Peak_1 = max(val_peaks)
    loc_1 = np.argmax(val_peaks)
    val_peaks = np.delete(val_peaks, loc_1)
    Peak_1 = max(val_peaks)
    loc_1 = np.argmax(val_peaks)
    Zpeaks = z[locs]

    return []




def ReconstructedVideo(Z, G, EI, deltax, deltay, lensx, lensy, PixelSize, zg, h):
    M = zg / Z
    F = back_proj(EI, G, deltax, deltay, lensx, lensy, PixelSize, M)
    S = sensetivity1(EI, deltax, deltay, lensx, lensy, PixelSize, M)
    F = np.array(F)
    S = np.array(S)
    f = F / S
    f = np.uint8(f)
    f = scipy.ndimage.filters.convolve(f[0, :, :], h, mode='constant')
    distance = f"{str(Z)}"
    Int_Img = f
    return [distance, Int_Img]

def ROI_AGMR(image, boxes, mask, ids, names, G, zg, lensx, lensy, zmin, zmax, EI, deltax, deltay, PixelSize):
    num_instances = boxes.shape[0]
    agmr_roi =np.arry()
    max_agmr = []
    for q in range(num_instances):  # Number of objects  in the current frame
        if not np.any(boxes[q]):
            continue

        y1, x1, y2, x2 = boxes[q]
        label = names[ids[q]]  # class name of the object in the ROI
        z = resolution(zg, L, deltax, zmin, zmax)
        z = np.array(z)
        z = z.flat
        Agmr = np.zeros(len(z))
        h = gkern(l=3, sig=1.)
        for i in range(0, len(z)):
            M = zg / z[i]
            F = back_proj(EI, G, deltax, deltay, lensx, lensy, PixelSize, M)
            S = sensetivity1(EI, deltax, deltay, lensx, lensy, PixelSize, M)
            F = np.array(F)
            S = np.array(S)
            f = F / S
            f = np.uint8(f)
            f = scipy.ndimage.filters.convolve(f[0, :, :], h, mode='constant')
            crop_img = f[0, y1:y2, x1:x2]  # crop the image for calculate the AGMR of the ROI
            label = names[ids[i]]  # class name of the object in the ROI
            grad_x = cv2.Sobel(crop_img, cv2.CV_64F, 1, 0, ksize=1)
            grad_y = cv2.Sobel(crop_img, cv2.CV_64F, 0, 1, ksize=1)
            abs_grad_x = cv2.convertScaleAbs(grad_x)
            abs_grad_y = cv2.convertScaleAbs(grad_y)
            grad = cv2.addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0)
            # grad = cv2.Canny(image=f, threshold1=30, threshold2=120)
            plt.imshow(grad, cmap=plt.cm.gray)
            plt.show()
            AGMR_ave = np.mean(grad)
            Agmr[i] = AGMR_ave
        locs, val_max = find_peaks(Agmr, height=0)
        v = np.array(list(val_max.items()))
        val_max = np.array(v[0, 1], dtype=np.float)
        Zpeaks = z[locs]
        agmr_roi[q, :] = Agmr
        max_agmr[1, q] = np.max(Agmr)
        return[agmr_roi]


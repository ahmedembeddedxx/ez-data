import cv2 as cv
import pandas as pd
import numpy as np

img1 = cv.imread('images/image1.jpeg')

def rescale(frame, scale=0.75):
    width = int(frame.shape[1] * scale)
    length = int(frame.shape[0] * scale)
    
    dimensions = (width, length)
    return cv.resize(frame, dimensions, interpolation=cv.INTER_AREA)

img1 = rescale(img1)
#img1.shape

cv.imshow('Image', img1)
cv.waitKey(0)

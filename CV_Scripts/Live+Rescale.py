import cv2 as cv
import pandas as pd
import numpy as np
    

def resize(frame, ratio=0.75):
    width = int(frame.shape[1] * ratio)
    height = int(frame.shape[0] * ratio)
    dimension = (width, height)
    return cv.resize(frame, dimension, interpolation=cv.INTER_AREA)

live_vid = cv.VideoCapture(0)


while True:
    isTrue, frame = live_vid.read()
    resized_frame = resize(frame, 0.2)
    cv.imshow('Live Video',resized_frame)
    
    if cv.waitKey(20) & 0xFF==ord('q'):
        break

live_vid.release()
cv.waitKey(0)

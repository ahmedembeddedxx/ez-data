import cv2 as cv
import pandas as pd
import numpy as np
    
live_vid = cv.VideoCapture(0)

while True:
    isTrue, frame = live_vid.read()
    cv.imshow('Live Video', frame)
    
    if cv.waitKey(20) & 0xFF==ord('q'):
        break


live_vid.release()
cv.waitKey(0)

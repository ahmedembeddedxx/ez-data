import cv2 as cv
import pandas as pd
import numpy as np

live_vid = cv.VideoCapture(0)

def drawcircle(frame):
    cv.circle(frame, (frame.shape[1]//2, frame.shape[0]//2), 200, (0, 255, 0), thickness=3)
        

while True:
    isTrue, frame = live_vid.read()
    drawcircle(frame)
    cv.imshow('Live Video', frame)
    
    if cv.waitKey(20) & 0xFF == ord('q'):
        break

live_vid.release()
cv.waitKey(0)

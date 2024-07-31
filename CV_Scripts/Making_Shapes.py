import cv2 as cv
import pandas as pd
import numpy as np

live_vid = cv.VideoCapture(0)

def drawbox(frame):
    x1 = int(frame.shape[1] * (1/3)) 
    y1 = int(frame.shape[0] * (1/5))
    
    x2 = int(frame.shape[1] * (2/3)) 
    y2 = int(frame.shape[0] * (4/5))
    
    for i in range(y1, y2): 
        for j in range(x1, x2):
            if i not in range(y1+2, y2-2) or j not in range(x1+2, x2-2):
                frame[i][j] = (0, 255, 0)
            

while True:
    isTrue, frame = live_vid.read()
    drawbox(frame)
    cv.imshow('Live Video', frame)
    
    if cv.waitKey(20) & 0xFF == ord('q'):
        break

live_vid.release()
cv.waitKey(0)

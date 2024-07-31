import cv2 as cv
import pandas as pd

live_vid = cv.VideoCapture(0)


while True:
    isTrue, frame = live_vid.read()
    frame = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
    
    cv.imshow("Live", frame)
    if cv.waitKey(20) & 0xFF == ord('0'):
        break


live_vid.release()
cv.destroyAllWindows()


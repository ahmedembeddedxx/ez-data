import cv2 as cv
import numpy as np

live_vid = cv.VideoCapture(0)

def translate(frame, x, y):
    Translation_Matrix = np.float32([[1, 0, x], [0, 1, y]])
    dimensions = (frame.shape[1], frame.shape[0])
    return cv.warpAffine(frame, Translation_Matrix, dimensions)



while True:
    isTure, frame = live_vid.read()
    frame = translate(frame, 100, 100)
    
    
    cv.imshow("Video", frame)
    if cv.waitKey(20) & 0xFF==ord('0'):
        break
    
live_vid.release()
cv.destroyAllWindows()

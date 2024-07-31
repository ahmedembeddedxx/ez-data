import cv2 as cv
import numpy as np

live_vid = cv.VideoCapture(0)

def rotate(frame, angle, rot_point=None):
    (height, width) = frame.shape[:2]
    if rot_point is None:
        rot_point=(height//2, width//2)
    rotMat = cv.getRotationMatrix2D(rot_point, angle, 1.0)
    dim = (width, height)
    return cv.warpAffine(frame, rotMat, dim)

ang = 10
while True:
    isTure, frame = live_vid.read()
    frame = translate(frame, 100, 100)
    frame = rotate(frame, ang%360)
    ang+=1
    cv.imshow("Video", frame)
    if cv.waitKey(20) & 0xFF==ord('0'):
        break
    
live_vid.release()
cv.destroyAllWindows()

import cv2 as cv

img = cv.imread('images/image4.png')

#img = cv.GaussianBlur(img, (5, 5), cv.BORDER_DEFAULT)
img = cv.Canny(img, 125, 175)
img = cv.dilate(img, (5, 5), iterations=3)
img = cv.erode(img, (5, 5), iterations=1)


cv.imshow("X-RAY", img)
cv.waitKey(0)


import cv2 as cv

live_vid = cv.VideoCapture(0)

while True:
    isTure, frame = live_vid.read()
    
    frame = cv.GaussianBlur(frame, (3, 3), cv.BORDER_DEFAULT)
    frame = cv.Canny(frame, 100, 200)
    frame = cv.dilate(frame, (7, 7), iterations=3) 
    frame = cv.erode(frame, (3, 3), iterations=3)
    
    cv.imshow("Video", frame)
    if cv.waitKey(20) & 0xFF==ord('0'):
        break
    
live_vid.release()
cv.destroyAllWindows()

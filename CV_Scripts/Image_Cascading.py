import cv2 as cv

live_vid = cv.VideoCapture(0)

while True:
    isTrue, frame = live_vid.read()
    frame = cv.GaussianBlur(frame, (3, 3), cv.BORDER_DEFAULT)
    frame = cv.Canny(frame, 100, 200)
    
    cv.imshow("Cascade Edges", frame)
    
    if cv.waitKey(20) & 0xFF==ord('0'):
        break
    
live_vid.release()
cv.destroyAllWindows()

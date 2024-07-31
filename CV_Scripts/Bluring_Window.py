import cv2 as cv

live_vid = cv.VideoCapture(0)

def blurme(frame, x=0, y=0, s = 200):
    top_left_corner = frame[x:x+s, y:y+s]
    blurred_top_left_corner = cv.GaussianBlur(top_left_corner, (13, 13), cv.BORDER_DEFAULT)
    frame[x:x+s, y:y+s] = blurred_top_left_corner
    frame[x:x+s:5, y:y+s:2] = (0, 0, 255)
    return frame

x = 0
y = 0
s = 200
'''
Use Up, Down, Left, Right Keys to move the bluring window, + and - for increasing and decreasing size of window
'''


while True:
    isTrue, frame = live_vid.read()
    frame = blurme(frame, x, y, s)
    cv.imshow("Blurred", frame)
    
    if not isTrue:
        break

    key = cv.waitKey(20) & 0xFF
    if key == ord('0'):
        break
    elif key != 255:
        if key == 0:
            x-=10
        if key == 1:
            x+=10
        if key == 2:
            y-=10
        if key == 3:
            y+=10
        if key == ord('+'):
            s+=10
        if key == ord('-'):
            s-=10
            


live_vid.release()
cv.destroyAllWindows()

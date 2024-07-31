import cv2 as cv

live_vid = cv.VideoCapture(0)


def puttext(frame, text, x):
    x[0]+=text
    cv.putText(frame, x[0], (100, 100), cv.FONT_ITALIC, 2.0, (0, 0, 0), 2)

x = [""]
while True:
    isTrue, frame = live_vid.read()
    if not isTrue:
        break

    key = cv.waitKey(20) & 0xFF
    if key == ord('0'):
        break
    elif key != 255:
        key_char = chr(key)
        puttext(frame, key_char, x)
    else:
        key_char = ''
        puttext(frame, key_char, x)

    cv.imshow('Live Video', frame)

live_vid.release()
cv.destroyAllWindows()

import cv2



z = []
v = []

import aisecurity
facenet=aisecurity.FaceNet("/home/aisecurity/.aisecurity/models/20180402-114759.pb", sess=True)
aisecurity.face.detection.detector_init(min_face_size=250)
for i in range(20):
	x = cv2.imread('/home/aisecurity/ai-kiosk/liam.jpg')
	print(x)
	facenet.predict(x)

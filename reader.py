from mfrc522 import SimpleMFRC522
import RPi.GPIO as gpio
from firebase import firebase

reader = SimpleMFRC522()
firebase = firebase.FirebaseApplication("https://kenko-rakathon2019.firebaseio.com/", None)

try:
	id, text = reader.read()
	details = firebase.get('/kenko-rakathon2019/User_Details', '')
	for entry in details:
		print(details[entry]["UniqueID"])
		if details[entry]["UniqueID"] == str(id):
			print(details[entry])

finally:
	gpio.cleanup()

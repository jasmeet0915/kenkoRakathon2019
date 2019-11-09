import RPi.GPIO as gpio
from mfrc522 import SimpleMFRC522
from firebase import firebase

reader = SimpleMFRC522()
firebase = firebase.FirebaseApplication("https://kenko-rakathon2019.firebaseio.com/")

try:
	id, text = reader.read()
	details = []
	file = open("details.txt", "r")
	file_data = file.readlines()
	for word in file_data:
		word = word[:-1] # slice the string word and remove last character
		details.append(word)
	print(details)
	field_names = ('Name', 'Age', 'Blood Group', 'Gender', 'EmailID', 'Address', 'Health Insurance', 'Organization', 'Birth Mark', 'Diabetic', 'Physically Challenged', 'Emergency Contact')
	data = dict(zip(field_names, details)) # create dictionary from two lists dict() creates empty list
	print(data)
	print("unique ID:"+str(id))
	result = firebase.post('/kenko-rakathon2019/User_Details', data=data)
	print(result)

finally:
	gpio.cleanup()


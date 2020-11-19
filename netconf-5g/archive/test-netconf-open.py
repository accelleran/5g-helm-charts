import socket

a_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

location = ("10.55.1.2", 30359)
while True:
    result_of_check = a_socket.connect_ex(location)

    if result_of_check == 0:
       print("Port is open")
    else:
       print("Port is not open")

a_socket.close()

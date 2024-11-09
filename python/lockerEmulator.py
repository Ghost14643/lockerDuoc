import cv2
from pyzbar.pyzbar import decode

# Carga y decodifica la imagen del código QR
img = cv2.imread('qr_code.png')
decoded_objects = decode(img)

for obj in decoded_objects:
    encrypted_data = obj.data

# Descifra los datos
decrypted_data = cipher.decrypt(encrypted_data)
print(decrypted_data.decode())

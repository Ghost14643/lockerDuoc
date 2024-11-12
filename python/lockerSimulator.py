import cv2
from pyzbar.pyzbar import decode
from cryptography.fernet import Fernet
import time

# Cargar clave y almacenar en la raiz
with open('secret.key', 'rb') as key_file:
    key = key_file.read()

cipher = Fernet(key)

# Simular que el locker se abrio
def open_locker(locker_id, runEstudiante):
    print(f"Locker {locker_id} del estudiante {runEstudiante} abierto")

# inicio de la camara
cap = cv2.VideoCapture(0)
while True:
    ret, frame = cap.read()
    if not ret:
        print("Error al acceder a la cámara")
        break

    datosDecodificados = decode(frame)
    for obj in datosDecodificados:
        datosEncriptados = obj.data
        
        try:
            datosDecifrados = cipher.decrypt(datosEncriptados).decode('utf-8')
            locker_id,runEstudiante, tiempoExpirado = datosDecifrados.split(':')
            tiempoExpirado = int(tiempoExpirado)
            sysdate = int(time.time())
            if sysdate < tiempoExpirado:
                open_locker(locker_id, runEstudiante)
                print("Token válido")
                exit()
            else:
                print("Token expirado")
        except Exception as e:
            print("Código QR no válido", e)


#Muestra la vista previa de la camara
    cv2.imshow("vista camara :D",frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()





# import cv2
# from pyzbar.pyzbar import decode
# from cryptography.fernet import Fernet
# # Carga la clave de cifrado
# with open('secret.key', 'rb') as key_file:
#     key = key_file.read()
# cipher = Fernet(key)
# # Carga y decodifica la imagen del código QR
# img = cv2.imread('qr_code.png')
# decoded_objects = decode(img)
# for obj in decoded_objects:
#     encrypted_data = obj.data
# # Descifra los datos
# decrypted_data = cipher.decrypt(encrypted_data)
# print(decrypted_data.decode())
# # Carga la imagen del código QR
# def escanear_qr():
#     cap = cv2.VideoCapture(0)
#     while True:
#         ret, frame = cap.read()
#         decoded_objects = decode(frame)
#         for obj in decoded_objects:
#             print(obj.data.decode())
#         if cv2.waitKey(1) & 0xFF == ord('q'):
#             break
#     cap.release()
# escanear_qr()

from dataBaseConnection import get_db
app, mysql = get_db()
import qrcode
from cryptography.fernet import Fernet
import time
el = "--------------------------------------"
# @app.route('/')
# def index():
#     return "TEST"
def crearKey():
    key = Fernet.generate_key()

    # Guarda la clave para su uso posterior
    with open('secret.key', 'wb') as key_file:
        key_file.write(key)
    return key

    

try:
    #Carga la clave de la raiz del proyecto y lo almacena como constante
    with open('secret.key', 'rb') as key_file:
     key = key_file.read()
     cipher = Fernet(key)

except FileNotFoundError: #si no encuentra el archivo, creara uno nuevo
    keyCreado=crearKey()
    cipher = Fernet(keyCreado)




# Datos a codificar (ejemplo: locker ID y token)
locker_id = 'locker1'
runEstudiante = int(21300379)
token_data = f'{locker_id}:{runEstudiante}:{int(time.time()) + 300}'  # Token expira en 5 minutos

# Cifra los datos
encrypted_data = cipher.encrypt(token_data.encode())

# Genera el código QR
qr = qrcode.QRCode(version=1, box_size=10, border=5)
qr.add_data(encrypted_data)
qr.make(fit=True)
img = qr.make_image(fill='black', back_color='white')

# Guarda la imagen del código QR
img.save('qr_code.png')




def hash_test():
    import hashlib
    trans= hashlib.sha256(b"hola").hexdigest()
    print(trans)
    vuelve= hashlib.sha256(trans).hexdigest
    print(vuelve)




def dataCount():
    with app.app_context():
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'lockersbd'")
        temp = cursor.fetchall()
        print(el)
        print(f"La cantidad de tablas en la BDD es: ",temp[0][0])
        print(el)
        print()
        cursor.execute(
        """SELECT idLocker, numeroLocker, pe.pisoCol, ei.letraEdificio , estado_locker_idEstadoLocker
        FROM locker l 
        INNER JOIN piso_edificio pe ON l.piso_edificio_idPiso = pe.idPiso
        INNER JOIN edificio_instituto ei ON pe.edificio_instituto_idEdificioInstituto = ei.idEdificioInstituto""")
        temp = cursor.fetchall()

        print(f"id: ", temp[0][0])




        cursor.close()



# if __name__ == '__main__':
#     app.run(debug=True)
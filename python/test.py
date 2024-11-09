from dataBaseConnection import get_db
app, mysql = get_db()
el = "--------------------------------------"
# @app.route('/')
# def index():
#     return "TEST"


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



dataCount()


if __name__ == '__main__':
    app.run(debug=True)
from flask import render_template, request, redirect, jsonify, session
from flask_cors import CORS
from dataBaseConnection import get_db  #conexión a la base de datos

app, mysql = get_db()
CORS(app)  # Habilitar CORS
app.secret_key = 'claveMaestra'

@app.route('/login')
def login():
    return render_template('login.html')

# Ruta para el formulario de login
@app.route('/formLogin', methods=['POST'])
def formLogin():
    if request.method == 'POST':
        # Obtener los datos del formulario
        email = request.form['email']
        password = request.form['password']

        # Consultar la base de datos para verificar el usuario y la contraseña
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM alumno WHERE emailAlumno = %s AND contrasenAlumno = %s", (email, password))
        user = cur.fetchone()
        cur.close()

        if user:
            # Guardar los datos del usuario en la sesión
            session['logged_in'] = True
            session['user_id'] = user[0]  # Guarda el ID del usuario (ajusta según tu base de datos)
            session['email'] = email
            return redirect('/')
        else:
            mensaje = "Usuario o contraseña incorrectos"
            return render_template('login.html', mensaje=mensaje)
        


# Ruta para cerrar sesión
@app.route('/logout')
def logout():
    # Elimina los datos de la sesión para cerrar la sesión del usuario
    session.pop('logged_in', None)
    session.pop('user_id', None)
    session.pop('email', None)
    return redirect('/login')


@app.route('/usuario-reserva')
def usuarioReserva():
    return render_template('usuario-reserva.html')

@app.route('/')
def index():
    
    if not session.get('logged_in'):
        return redirect('/login')
    print(session['logged_in'],session['user_id'], session['email'] )
    # Recibir filtros desde el formulario
    estado = request.args.get('estado')
    piso = request.args.get('piso')
    edificio = request.args.get('edificio')
    cursor = mysql.connection.cursor()

    # Construir la consulta con filtros
    query = """
    SELECT idLocker, numeroLocker, pe.pisoCol, ei.letraEdificio , estado_locker_idEstadoLocker
    FROM locker l 
    INNER JOIN piso_edificio pe ON l.piso_edificio_idPiso = pe.idPiso
    INNER JOIN edificio_instituto ei ON pe.edificio_instituto_idEdificioInstituto = ei.idEdificioInstituto
    WHERE 1=1
    """
    params = []

    if estado:
        query += " AND estado_locker_idEstadoLocker = %s"
        if estado == "Disponible":
            params.append(1)
        elif estado == "Ocupado":
            params.append(2)
        elif estado == "Con Problema":
            params.append(3)
    
    if piso:
        query += " AND pe.pisoCol = %s"
        params.append(piso)

    if edificio:
        query += " AND letraEdificio = %s"
        if edificio == "Y":
            params.append(4)
        elif edificio == "W":
            params.append(5)
        elif edificio == "Z":
            params.append(3)


    cursor.execute(query, params)
    datos = cursor.fetchall()

    # Traducir el estado
    translated_data = []
    for locker in datos:
        idLocker, numeroLocker, pisoCol, letraEdificio , estado = locker
        


        # Traducir el estado del locker
        if estado == 1:
            estado_texto = "Disponible"
        elif estado == 2:
            estado_texto = "Ocupado"
        elif estado == 3:
            estado_texto = "Con Problema"
        else:
            estado_texto = "Desconocido"

        translated_data.append((idLocker, numeroLocker, pisoCol, letraEdificio, estado_texto))

    cursor.close()
    return render_template('index.html', datos=translated_data)

# Nueva ruta para mostrar la reserva activa de un locker
@app.route('/reserva_activa/<int:locker_id>')
def reserva_activa(locker_id):
    cursor = mysql.connection.cursor()

    # Obtener los datos de la reserva activa del locker seleccionado
    query = """
        SELECT r.fecha_inicio, r.fecha_fin, a.pNombreAlumno, a.apPaternoAlumno, a.runAlumno
        FROM reserva_alumno r
        INNER JOIN alumno a ON r.alumno_runAlumno = a.runAlumno
        WHERE r.locker_idLocker = %s AND r.estadoReserva_idEstadoReserva = 1
    """
    cursor.execute(query, (locker_id,))
    reserva = cursor.fetchone()  # Asumimos que solo hay una reserva activa por locker

    cursor.close()

    if reserva:
        reserva_data = {
            'fecha_inicio': reserva[0],
            'fecha_fin': reserva[1],
            'nombre_alumno': reserva[2],
            'apellido_alumno': reserva[3],
            'run_alumno': reserva[4]
        }
        return render_template('reserva_activa.html', reserva=reserva_data)
    else:
        return f"No hay reservas activas para el locker con ID {locker_id}."



def add_locker():
    numero = request.form['numero']
    piso = request.form['piso']
    estado = request.form['estado']
    
    cursor = mysql.connection.cursor()
    cursor.execute("INSERT INTO locker (numeroLocker, piso_edificio_idPiso, estado_locker_idEstadoLocker) VALUES (%s, %s, %s)", (numero, piso, estado))
    mysql.connection.commit()
    cursor.close()

    return redirect('/')

# Ruta para obtener los lockers en formato JSON
@app.route('/api/lockers', methods=['GET'])
def get_lockers():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT idLocker, numeroLocker, pe.pisoCol , piso_edificio_idPiso ,estado_locker_idEstadoLocker FROM locker l INNER JOIN piso_edificio pe ON l.piso_edificio_idPiso = pe.idPiso")
    datos = cursor.fetchall()
    
    # Traducir el estado
    translated_data = []

    for locker in datos:
        edificio = locker[3]
        if edificio == 1:
            estado_edificio = "Y"
        elif edificio == 2:
            estado_edificio = "W"
        elif edificio == 3:
            estado_edificio = "Z"
        else:
            estado_edificio = "???"


    for locker in datos:
        estado = locker[4]  # estado_locker_idEstadoLocker
        if estado == 1:
            estado_texto = "Disponible"
        elif estado == 2:
            estado_texto = "Ocupado"
        elif estado == 3:
            estado_texto = "Con Problema"
        else:
            estado_texto = "Desconocido"

        translated_data.append({
            'id': locker[0],
            'numero': locker[1],
            'piso': locker[2],
            'edificio': estado_edificio,
            'estado': estado_texto
        })

    cursor.close()
    return jsonify(translated_data)

# Ruta para mostrar la página de reserva
@app.route('/reserva')
def reserva():
    return render_template('reserva.html')


# Ruta para reservar un locker
@app.route('/reserve', methods=['POST'])
def reserve_locker():

    locker_id = request.form['numeroLocker']  # Obtener el ID del locker desde el formulario
    edificio_Locker = request.form['edificio']
    rut_estudiante = session['user_id'] #utiliza el run de usuario iniciado
    start_date = request.form['startDate']
    end_date = request.form['endDate']
    estado = '1'
    tipo_reserva = '1'

    cursor = mysql.connection.cursor()
    cursor.execute("SELECT idLocker FROM locker WHERE 1=1 AND numeroLocker = %s AND piso_edificio_id_Piso = %s", (locker_id,edificio_Locker) )
    cursor.execute("INSERT INTO `lockersbd`.`reserva_alumno` (`fecha_inicio`, `fecha_fin`, `locker_idLocker`, `alumno_runAlumno`, `estadoReserva_idEstadoReserva`, `reserva_idReserva`) VALUES (%s, %s, %s, %s, %s, %s)", (start_date, end_date, locker_id, rut_estudiante, estado, tipo_reserva))
    mysql.connection.commit()
    cursor.close()

    return redirect('/')  # Redirige al índice después de reservar

# Ruta para mostrar la página de cancelación
@app.route('/cancelacion')
def cancelacion():
    return render_template('cancelacion.html')



# Ruta para cancelar una reserva
@app.route('/cancel', methods=['POST'])
def cancel_reservation():
    idReserva = request.form['idReserva']
    rutAdmin = request.form['rutAdmin']
    observacion = request.form['observacion']
    cursor = mysql.connection.cursor()
    cursor.execute("INSERT INTO `lockersbd`.`cancelacion_reserva` (`administrador_runAdministrador`, `reserva_alumno_idReservaAlumno`, `observacion`) VALUES (%s , %s , %s)" , (rutAdmin, idReserva ,  observacion)) 
    mysql.connection.commit()
    cursor.close()
    return redirect('/')  # Redirige al índice después de cancelar



if __name__ == '__main__':
    app.run(debug=True)



def verificarLocker():
    numLocker = request.form['numeroLocker']
    pisoLocker = request.form['pisoLocker']
    edificioLocker = request.form['edifLocker']
    if 1 <= edificioLocker <= 5:
        estado_edificio = "Y"
    elif 6 <= edificioLocker <= 10:
        estado_edificio = "W"
    elif 11 <= edificioLocker <= 14:
        edificioLocker = "Z"
    else:
        edificioLocker = ""

    cursor = mysql.connection.cursor() 
    cursor.execute("SELECT idLocker , estado_locker_idEstadoLocker from locker WHERE numeroLocker = 1 AND piso_edificio_idPiso = 3 AND")





    locker_id = request.form['numeroLocker']  # Obtener el ID del locker desde el formulario
    rut_estudiante = request.form['rutEstudiante'] # Obtiene el rut del estudiante desde el formulario
    start_date = request.form['startDate']
    end_date = request.form['endDate']
    estado = '1'
    tipo_reserva = '1'

    cursor = mysql.connection.cursor()
    cursor.execute("INSERT INTO `lockersbd`.`reserva_alumno` (`fecha_inicio`, `fecha_fin`, `locker_idLocker`, `alumno_runAlumno`, `estadoReserva_idEstadoReserva`, `reserva_idReserva`) VALUES (%s, %s, %s, %s, %s, %s)", (start_date, end_date, locker_id, rut_estudiante, estado, tipo_reserva))
    mysql.connection.commit()
    cursor.close()

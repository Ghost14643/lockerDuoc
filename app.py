from flask import Flask, render_template, request, redirect, jsonify
from flask_cors import CORS
from flask_mysqldb import MySQL

app = Flask(__name__)
CORS(app)  # Habilita CORS

# Configuración de la base de datos
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'jDXgT61EhWinGAx0Wy2H'
app.config['MYSQL_DB'] = 'lockersbd'  # Asegúrate de que el nombre de la base de datos es correcto

mysql = MySQL(app)

@app.route('/')
def index():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT idLocker, numeroLocker, piso_edificio_idPiso, estado_locker_idEstadoLocker FROM locker")
    datos = cursor.fetchall()
    
    # Traducir el estado
    translated_data = []
    for locker in datos:
        estado = locker[3]  # estado_locker_idEstadoLocker
        if estado == 1:
            estado_texto = "Disponible"
        elif estado == 2:
            estado_texto = "Ocupado"
        elif estado == 3:
            estado_texto = "Con Problema"
        else:
            estado_texto = "Desconocido"

        translated_data.append((locker[0], locker[1], locker[2], estado_texto))  # Agregar estado traducido

    cursor.close()
    return render_template('index.html', datos=translated_data)

@app.route('/add', methods=['POST'])
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
    cursor.execute("SELECT idLocker, numeroLocker, piso_edificio_idPiso, estado_locker_idEstadoLocker FROM locker")
    datos = cursor.fetchall()
    
    # Traducir el estado
    translated_data = []
    for locker in datos:
        estado = locker[3]  # estado_locker_idEstadoLocker
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
# def reserve_locker():
#     locker_id = request.form['numeroLocker']  # Obtener el ID del locker desde el formulario
#     cursor = mysql.connection.cursor()
#     cursor.execute("UPDATE locker SET estado_locker_idEstadoLocker = 2 WHERE idLocker = %s", (locker_id,))  # 2 para 'Ocupado'
#     mysql.connection.commit()
#     cursor.close()


def reserve_locker():
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

    return redirect('/')  # Redirige al índice después de reservar

# Ruta para mostrar la página de cancelación
@app.route('/cancelacion')
def cancelacion():
    return render_template('cancelacion.html')



# Ruta para cancelar una reserva
@app.route('/cancel', methods=['POST'])
# def cancel_reservation():
#     locker_id = request.form['idLocker']  # Obtener el ID del locker desde el formulario
#     cursor = mysql.connection.cursor()
#     cursor.execute("UPDATE locker SET estado_locker_idEstadoLocker = 1 WHERE idLocker = %s", (locker_id,))  # 1 para 'Disponible'
#     mysql.connection.commit()
#     cursor.close()
    
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

import hashlib

palabra="hola"
trans= hashlib.sha256(b"hola").hexdigest()

print(trans)

vuelve= hashlib.sha256(trans).hexdigest

print(vuelve)

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
        params.append(edificio)


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




def index():
    
    if not session.get('logged_in'):
        return redirect('/login')
    print(session['logged_in'],session['user_id'], session['email'] ) #borrar cuando termine
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
    """ #pronto obsoleto
    params = []
    cursor.execute("SELECT idLocker, numeroLocker FROM locker")
    lockerData = cursor.fetchall() # [0] == idLocker || [1] == numeroLocker
    print(lockerData)
    datos=[]
    if estado:
        datos.append(filtroEstado(lockerData[0]))
    if piso:
        datos.append(filtroPiso(lockerData[0]))  
    if edificio:
        datos.append(filtroEdificio(lockerData[0]))

# Traducir el estado y otros atributos del locker
    translated_data = []
    for locker in lockerData:
        id_locker = locker[0]
        numero_locker = locker[1]
        
        # Obtener piso, edificio y estado traducido
        piso_texto = filtroPiso(id_locker)
        edificio_texto = filtroEdificio(id_locker)
        estado_valor = filtroEstado(id_locker)

        # Traducir el estado del locker
        if estado_valor == 1:
            estado_texto = "Disponible"
        elif estado_valor == 2:
            estado_texto = "Ocupado"
        elif estado_valor == 3:
            estado_texto = "Con Problema"
        else:
            estado_texto = "Desconocido"

        # Agregar los datos traducidos a la lista
        translated_data.append((id_locker, numero_locker, piso_texto, edificio_texto, estado_texto))

    cursor.close()
    return render_template('index.html', lockerData=translated_data)
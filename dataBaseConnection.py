from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__)

# Configuración de la base de datos
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'jDXgT61EhWinGAx0Wy2H' #jDXgT61EhWinGAx0Wy2H || Isa.2980246 
app.config['MYSQL_DB'] = 'lockersbd'  # Asegúrate de que el nombre de la base de datos es correcto

mysql = MySQL(app)

def get_db():
    return app, mysql

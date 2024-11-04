import subprocess
import sys

def install_requirements():
    try:
        # Ejecuta el comando de instalación de pip
        subprocess.check_call([sys.executable, "-m", "pip", "install", "-r", "requirements.txt"])
        print("Todas las librerías han sido instaladas correctamente.")
    except subprocess.CalledProcessError as e:
        print(f"Error al instalar las librerías: {e}")

if __name__ == "__main__":
    install_requirements()

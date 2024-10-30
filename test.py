import hashlib

palabra="hola"
trans= hashlib.sha256(b"hola").hexdigest()

print(trans)

vuelve= hashlib.sha256(trans).hexdigest

print(vuelve)


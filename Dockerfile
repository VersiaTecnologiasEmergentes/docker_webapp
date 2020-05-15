
# Escogemos una imagen de python v3.7 (alpine)
FROM python:3.7-alpine

# Evitamos que los logs aparezcan desordenados
ENV PYTHONUNBUFFERED 1

# Creamos una carpeta en la imagen para nuestro proyecto
RUN mkdir /code

# Situamos el directorio de trabajo en dicha ruta
WORKDIR /code

# Instalamos los paquetes de python necesarios mediante pip
# (en este caso, desde un fichero de requisitos)
COPY requirements.txt /code/
RUN pip install -r /code/requirements.txt

# Copiamos el código del proyecto del host a nuestra imagen
COPY webapp/ /code/

# Exponemos el puerto 8000 para la escucha
EXPOSE 8000

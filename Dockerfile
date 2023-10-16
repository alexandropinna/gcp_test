# Usar una imagen base de Node.js
FROM node:20.8.0

# Establecer el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copiar el package.json y package-lock.json para instalar las dependencias
COPY mongo/package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar el resto de los archivos de la aplicación al contenedor
COPY mongo/ .

# Establecer el puerto que la aplicación usará
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD [ "node", "server.js" ]

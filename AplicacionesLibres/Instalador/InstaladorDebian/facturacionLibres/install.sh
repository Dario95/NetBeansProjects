#!/bin/bash

# Un titulo de bienvenida podriamos ponerle para que sea más visual, para
# ello utilizaremos zenity, yad etc . 

zenity --info --title="Facturacion-Aplicaciones Libres" --text="Bienvenido la Instalacion de Facturacion-Aplicaciones Libres"

# Damos las instrucciones a nuestro programa; para copiar archivos, 
#directorios completos, este tambien incluye la imagen para el ícono, que
#podria ser png o svg por sus capacidades de escalamiento no mayor de
#128*128.

#Si son directorios completos podemos utilizar una copia recursiva, ejemplo
#cp -R  angelica /usr/bin/   "Angelica es mi directorio no vacío que quiero copiar a la
#ruta /usr/bin/"

#Crear base de datos

eval echo ~$USER|mkdir Plantillas

cp -f AplicacionesLibres.jar /usr/bin/ 

cp -f icono.svg /usr/share/icons/ 

cp -Rf lib /usr/bin/

cp -Rf src /usr/bin/

#Crear el lanzador, este paso es muy sencillo, podemos hacerlo con un simple "echo"
#siguiendo la estructura de abajo reemplazando por nuestro programa.


echo "[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Name=Facturacion
Exec=java -jar  /usr/bin/AplicacionesLibres.jar
Comment=para lo que sirva tu programa este se usara por defecto
Comment[es]= para lo que sirva tu programa este se usara si detecta español
Icon=/usr/share/icons/icono.svg
Categories=GTK;Utility; " >> /usr/share/applications/FacturacionLibres.desktop


# Le damos permisos a todo lo que se quiere ejecutar de nuestro programa.

chmod 777 /usr/bin/AplicacionesLibres.jar
chmod 777 /usr/share/applications/FacturacionLibres.desktop

# Le avisamos al usuario que ya se instalo el programa.  podríamos utilizar para que sea más visual, zenity, yad etc . 

zenity --info --title="Facturacion-Aplicaciones Libres" --text="La Instalacion a finalizado correctamente"

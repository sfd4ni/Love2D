# LÖVE
![Logo](https://1.bp.blogspot.com/-Mnv7YMlsGT4/X3-k6_YDYII/AAAAAAAAHPs/eOmAUaxXvqkv0l3hFDFFf28USMXgI_nzwCLcBGAsYHQ/s373/logo.png)
## ¿Qué es LÖVE?
---
LÖVE, también conocido como Love2d es un Framework pensado para el desarrollo de juegos en entornos 2D a partir del lenguaje de programación Lua. LÖVE es de uso completamente gratuito y está pensado tanto como para gente que quiere tomarlo como un hobby de código abierto, como para empresas que quieran hacer un proyecto con  el  mismo.
Su mayor ventaja es lo sencillo que es simplemente empezar a trabajar en este framework, solo tienes que instalar su aplicación, abrir cualquier editor de texto en el que programes y ejecutar tu código.

## Preparando tu setup
---
### Windows
Es impresionantemente sencillo. Primero, debemos de entrar en la página de [LÖVE oficial](https://love2d.org/#download) y descargar la versión que mejor convenga a nuestro sistema operativo, podemos utilizar tanto la versión zipped como la versión ejecutable para instalarla, pero ambas son de uso muy sencillo y se explica en el instalador mismo, y tienen lo que nos interesa y con lo que trabajaremos: love.exe.

### Linux

Solo tenemos que ejecutar los siguientes comandos
```console
sudo add-apt-repository ppa:bartbes/love-stable
sudo apt-get update
```
Y el comando **love** ya estará en nuestra disposición.

## Empezando el proyecto
---
Abrimos nuestro editor de texto de programación favorito, aunque en la página oficial se recomienda utilizar Sublime Text, puesto que tiene soporte de Lua integrado. Para este tutorial, utilizaremos Visual Studio Code, potentísimo editor en el que podemos instalar muchísimas extensiones de ayuda del lenguaje Lua. Ahora, crearemos una carpeta para nuestro proyecto, y dentro de ella crearemos un archivo llamado  ***main.lua***. Como ejemplo, vamos a desarrollar el ejemplo más básico de programación: un **'Hola Mundo'**.

El código sería este:
```console
function love.draw()
  love.graphics.print("Hola mundo", 400, 300)
end
```
En este código, escribirimos un 'Hola mundo' en las coordenadas 400 px del borde izquierdo, 300 px del borde superior.
## Ejecución  del programa
---
### Windows
#### 1. Instalando Love2D Support en extensiones de VSCode
Esta es la manera que más te traerá beneficio en el futuro, porque podrás ejecutar tu programa desde el propio VSCode.
Primero, buscamos en extensiones de VSCode Love2D Support, le damos a instalar y reiniciamos el editor. Normalmente, nos habrá enlazado la función de lanzar el progama con el atajo ***alt + l***, pero podemos comprobar con cual lo ha hecho seleccionando 
*File -> Preferences -> Keyboard Shortcuts* y buscando "love2D". Encontraremos ahí **"Run love2D on the workspace folder"** con el atajo que nos ha asignado. Podemos cambiarlo si así lo deseamos. 
![Shorcut](https://i.gyazo.com/78a72c326000c85ab1595fe0c04ce0a1.png)
Si tenemos la instalación hecha en el directorio por defecto, aquí acaba nuestro trabajo, pero si no, tendremos que ir a Extensions, buscar Love2D Support, darle a la ruedita de ajustes y cambiar el **Path to the Love2D executable file** a donde se encuentre el **ejecutable love.exe** del proyecto instalado o en formato zip.
![Ruta](https://i.gyazo.com/2b3e952b8072fa28f4a33b1827f12fea.png)
### 2. Mediante línea de comandos
Solamente tenemos que indicar la ruta del ejecutable love.exe en nuestro primer argumento, y luego una ruta al directorio de nuestro juego o al empaquetado de nuestro juego
```console
"<ruta_a_ejecutable_love>" "<ruta_directorio_mi_app>/<ruta_directorio_mi_juego_empaquetado>/""
"C:\Program Files\LOVE\love.exe" "C:\games\mygame"
"C:\Program Files\LOVE\love.exe" "C:\games\packagedgame.love"
```
Si queremos que la consola registre los print que tenemos en nuestro progama, deberemos de cambiar la primera parte a :
```C:\Program Files\LOVE\lovec.exe o "C:\Program Files\LOVE\love.exe" --console```

### Linux
Utilizamos estos comandos:
```console
love /home/path/to/gamedir/
love /home/path/to/packagedgame.love
```
o podemos utilizar la solución que utilizamos con VisualStudioCode en Windows.

## Salida de nuestro 'Hola Mundo'
---
![HolaMundo](https://i.gyazo.com/00f24723c559c2388bd2148e27098002.png)
Al ejecutar, nos sale este cuadrado que no podemos modificar de tamaño, que será el entorno de ejecución de cualquier juego que hagamos
## Conclusión
---
La sencillez de instalación y de preparación de entorno de esta aplicación realmente te dan ganas de empezar directamente. Es completamente gratuito, y tiene ya un recorrido de 14 años. Los problemas son que el lenguaje de programación Lua no es de los lenguajes más conocidos y al no tener la más grande de las comunidades, es más complicado encontrar documentación. Pero es, como mínimo, una manera divertida de entrar al desarrollo de videojuegos si tienes un nivel medio mínimo de programación.

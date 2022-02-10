<div align="justify">
# LÖVE
<div align="center">
  <img src="https://1.bp.blogspot.com/-Mnv7YMlsGT4/X3-k6_YDYII/AAAAAAAAHPs/eOmAUaxXvqkv0l3hFDFFf28USMXgI_nzwCLcBGAsYHQ/s373/logo.png" width="500px" />
</div>

## Índice
---
- [¿Qué es LÖVE?](https://github.com/sfd4ni/Love2D#qu%C3%A9-es-l%C3%B6ve)
- [Preparando tu setup](https://github.com/sfd4ni/Love2D#preparando-tu-setup)
- [Empezando el proyecto](https://github.com/sfd4ni/Love2D#empezando-el-proyecto)
- [Ejecución del programa](https://github.com/sfd4ni/Love2D#ejecuci%C3%B3n--del-programa)
- [Salida de nuestro 'Hola Mundo'](https://github.com/sfd4ni/Love2D#salida-de-nuestro-hola-mundo)
- [Juego Pong](https://github.com/sfd4ni/Love2D#juego-pong)

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
## Juego Pong
---
Lo siguiente que intenté para probar este recurso es un juego del Pong, siguiendo un tutorial de **[Disco duro de roer](https://www.youtube.com/watch?v=jbayJX-9F48)**.
![Pong](https://i.gyazo.com/feff631f7922345ad99ebafe52236375.jpg)
Esta es la salida de mi juego.
### Explicando función a función
La primera función que se va a cargar es love.load() al lanzar nuestra aplicación. Aquí declararemos el tamaño de pantalla, el títulos y los assets de nuestra aplicación que será el sonido de cuando se golpea los tenistas con love.audio y la imagen de fondo con love.graphics.newImage, y llamaremos a la función "reset(Ganador)".
```
-- Estamos creando una app para jugar al Pong clásico
function love.load()
  love.window.setTitle("Pong")
  love.window.setMode(1600, 800)
  background = love.graphics.newImage("fondo.jpg")
  sonidoPong = love.audio.newSource("hitSound.wav", "static")
  reset("J1")
end
```
Aquí tenemos la función reset que simplemente se encarga de preparar los tenistas y la bola tras empezar la partida y tras cada punto que se apunte. Declararemos sus posiciones en la pantalla (x, y), su velocidad de movimiento, sus proporciones (ancho, alto, radio) y luego la pelota tendrá dos booleans importantes, que definirán el movimiento de la pelota: arriba y derecha. El movimiento inicial en cada punto se decidirá por quién ganó, recibiendo la pelota hacia su campo.
```
function reset(ganador)
  -- Aquí declaramos al tenista de la izquierda, 
  -- dandole sus coordenadas para que corresponda al lado izq
  tenistaIzq = {}
  tenistaIzq.x = 100;
  tenistaIzq.y = 200;
  tenistaIzq.ancho = 25;
  tenistaIzq.alto = 150;
  tenistaIzq.velocidad = 8;
  tenistaIzq.puntacion = 0;

  -- El tenista derecho
  tenistaDer = {}
  tenistaDer.x = 1500;
  tenistaDer.y = 200;
  tenistaDer.ancho = 25;
  tenistaDer.alto = 150;
  tenistaDer.velocidad = 8;
  

  pelota = {}
  pelota.x = love.graphics.getWidth() / 2
  pelota.y = love.graphics.getHeight() / 2
  pelota.radio = 20
  pelota.arriba = false
  if ganador == "J1" then
    pelota.derecha = false
  else
    pelota.derecha = true
  end
  
  pelota.velocidad = 5
end
```
Ahora hablemos de la función que se **ejecuta en todo momento, en cada frame**: love.update. Esta función permite que en pantalla se actualicen las posiciones de lo que va pasando en la partida. Vemos que hemos asignado las teclas **arriba y abajo** de la cruceta a la raqueta derecha, y **w y s** a la raqueta izquierda
```
    function love.update(dt)
  -- Declaramos que el tenista del lado derecho de la
  -- pantalla va a moverse con las techas de arriba y
  -- abajo, mientras que el izquierdo lo hará con w y s
  movimiento(tenistaDer, "up", "down")
  movimiento(tenistaIzq, "w", "s")
  rebotarPelota(pelota)
end
```
Empecemos con Movimiento. Esta función es muy sencilla, hacemos que si la tecla asignada hacia arriba está siendo presionada y **no se ha llegado al borde de arriba**, el tenista se mueva hacia arriba, y lo mismo hacia abajo.
```
-- Comprobamos si se presiona el movimiento hacia
-- arriba o hacia abajo, para sumar o restar coordenadas
-- y que no se salga de pantalla
function movimiento(tenista, movArriba, movAbajo) 
  if love.keyboard.isDown(movArriba) and tenista.y >= 0 then
    tenista.y = tenista.y - tenista.velocidad;
  end

  if love.keyboard.isDown(movAbajo) and (tenista.y + tenista.alto) <= love.graphics.getHeight() then
    tenista.y = tenista.y + tenista.velocidad;
  end
end
```

Ahora la función rebotarPelota, que es donde se concentra el funcionamiento del juego. En el propio código he explicado qué significa cada trozo de código, al final del día son solo operaciones algorítmicas para comprobar la posición de la pelota, y así poder cambiar su movimiento. Hay dos partes en el código, el primer trozo hace el movimiento según los atributos booleanos de arriba y derecha, y la segunda cambia el estado de arriba y derecha dependiendo de donde ha golpeado. Está el añadido que si ha golpeado una raqueta, se aumenta la velocidad y se reproduce el sonido, y si pasa por los bordes izquierdos o derecho, se dice quién fue el ganador de la ronda a la función reset y se resetea las posiciones de la pelota y los tenistas.
```
-- Función que controlará el movimiento de nuestra pelota
function rebotarPelota(pelota)
  -- Aquí cambiaremos el movimiento de nuestra
  -- pelota dependiendo de los eventos que hayan
  -- cambiado nuestras propiedades de dirección
  if pelota.derecha then
    pelota.x =  pelota.x + pelota.velocidad
  else
    pelota.x = pelota.x - pelota.velocidad
  end
  if pelota.arriba then
    pelota.y =  pelota.y - pelota.velocidad
  else
    pelota.y = pelota.y + pelota.velocidad
  end


  -- Golpea en tenista de la izquierda, suena el audio de pong, y
  -- aumenta la velocidad de la pelota
  if (pelota.x - pelota.radio) <= (tenistaIzq.x + tenistaIzq.ancho)
      and (pelota.x - pelota.radio) >= (tenistaIzq.x)
      and (pelota.y ) >= (tenistaIzq.y)
      and (pelota.y ) <= (tenistaIzq.y + tenistaIzq.alto) then
        love.audio.play(sonidoPong)
        pelota.derecha = true
        pelota.velocidad = pelota.velocidad + 1
  end

  -- Golpea en tenista de la derecha, suena el audio de pong, y
  -- aumenta la velocidad de la pelota
  if (pelota.x + pelota.radio) >= (tenistaDer.x)
    and (pelota.x + pelota.radio) <= (tenistaDer.x + tenistaDer.ancho)
    and (pelota.y ) >= (tenistaDer.y)
    and (pelota.y ) <= (tenistaDer.y + tenistaDer.alto) then
      love.audio.play(sonidoPong)
      pelota.derecha = false
      pelota.velocidad = pelota.velocidad + 1
  end

  -- Punto para J1
  if (pelota.x + pelota.radio) >= love.graphics.getWidth() then
    reset("J1")
  end

  -- Punto para J2
  if (pelota.x - pelota.radio) <= 0 then
    reset("J2")
  end

  -- Rebota en el borde de abajo
  if (pelota.y + pelota.radio) >= love.graphics.getHeight() then
    pelota.arriba = true
  end

  -- Rebota en el borde de arriba
  if (pelota.y - pelota.radio) <= 0 then
    pelota.arriba = false
  end

end
```

Hasta aquí la parte funcional del programa, ahora la función que renderiza es love.draw(). Funciona por capas, el orden que seguirá es lineal. **IMPORTANTE**, si quieres que tus elementos como imágenes no cojan colores de otros elementos, tienes que especicarle que quieres blanco, por ejemplo en este caso, si no heredará el color de alguno de sus compañeros. Así es un poco como funciona setColor, no puedes hacer setColor a un elemento y ya está, tienes que hacer un setColor y luego pintar tus formas que quieres encima. Si quitaramos el setColor(1,1,1), nuestra app quedaría azul.
```
-- Función que dibujará nuestra app.
function love.draw()
  love.graphics.setBackgroundColor(1, 1, 1)
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(background)
  
  love.graphics.setColor(207/255, 59/255, 23/255)
  love.graphics.circle("fill", pelota.x, pelota.y, pelota.radio)
  
  love.graphics.setColor(23/255, 118/255, 207/255)
  love.graphics.rectangle("fill", tenistaIzq.x, tenistaIzq.y, tenistaIzq.ancho, tenistaIzq.alto)
  love.graphics.rectangle("fill", tenistaDer.x, tenistaDer.y, tenistaDer.ancho, tenistaDer.alto)
  
end
```
### Producto final

Aquí vemos como funciona correctamente el programa, teniendo un producto final bastante decente

https://user-images.githubusercontent.com/72398621/153402861-58c265e3-6d94-439e-8d92-000b19362ab8.mp4



## Conclusión
---
La sencillez de instalación y de preparación de entorno de esta aplicación realmente te dan ganas de empezar directamente. Es completamente gratuito, y tiene ya un recorrido de 14 años, el nivel de programación que demanda para entrar este framework es bajo, lo cual lo convierte ideal para la enseñanza y el autoaprendizaje hacia el mundo de los videojuegos. Los problemas son que el lenguaje de programación Lua no es de los lenguajes más conocidos y al no tener la más grande de las comunidades, es más complicado encontrar documentación. Pero es, como mínimo, una manera divertida de entrar al desarrollo de videojuegos si tienes un nivel mínimo de programación.
                                  </div>
                                  
                                  

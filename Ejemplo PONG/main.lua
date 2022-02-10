-- Estamos creando una app para jugar al Pong clásico
function love.load()
  love.window.setTitle("Pong")
  love.window.setMode(1600, 800)
  background = love.graphics.newImage("fondo.jpg")
  sonidoPong = love.audio.newSource("hitSound.wav", "static")
  reset("J2")
  
end

function love.update(dt)
  -- Declaramos que el tenista del lado derecho de la
  -- pantalla va a moverse con las techas de arriba y
  -- abajo, mientras que el izquierdo lo hará con w y s
  movimiento(tenistaDer, "up", "down")
  movimiento(tenistaIzq, "w", "s")
  rebotarPelota(pelota)
end
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
-- Función que dibujará nuestra
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
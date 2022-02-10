-- Estamos creando una app para jugar al Pong clásico
function love.load()
  love.window.setTitle("Pong")
  love.window.setMode(1600, 800)
  
  -- Aquí declaramos al tenista de la izquierda, 
  -- dandole sus coordenadas para que corresponda al lado izq
  tenistaIzq = {}
  tenistaIzq.x = 100;
  tenistaIzq.y = 200;
  tenistaIzq.ancho = 25;
  tenistaIzq.alto = 100;
  tenistaIzq.velocidad = 5;

  -- El tenista derecho
  tenistaDer = {}
  tenistaDer.x = 1500;
  tenistaDer.y = 200;
  tenistaDer.ancho = 25;
  tenistaDer.alto = 100;
  tenistaDer.velocidad = 5;
  background = love.graphics.newImage("fondo.jpg")

  pelota = {}
  pelota.x = love.graphics.getWidth() / 2
  pelota.y = love.graphics.getHeight() / 2
  pelota.radio = 20
  pelota.derecha = false
  pelota.arriba = false
  pelota.velocidad = 5
  
end

function love.update(dt)
  -- Declaramos que el tenista del lado derecho de la
  -- pantalla va a moverse con las techas de arriba y
  -- abajo, mientras que el izquierdo lo hará con w y s
  movimiento(tenistaDer, "up", "down")
  movimiento(tenistaIzq, "w", "s")
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
-- Función que dibujará nuestros dos rectángulos.
function love.draw()
    for i = 0, love.graphics.getWidth() / background:getWidth() do
      for j = 0, love.graphics.getHeight() / background:getHeight() do
          love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
      end
  end
  
  love.graphics.setColor(207, 59, 23)
  love.graphics.circle("fill", pelota.x, pelota.y, pelota.radio)
  love.graphics.setColor(23, 118, 207)
  love.graphics.rectangle("fill", tenistaIzq.x, tenistaIzq.y, tenistaIzq.ancho, tenistaIzq.alto)
  love.graphics.setColor(23, 118, 207)
  love.graphics.rectangle("fill", tenistaDer.x, tenistaDer.y, tenistaDer.ancho, tenistaDer.alto)
end
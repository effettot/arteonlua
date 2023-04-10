function love.load()
  love.window.setTitle("Generatore di arte astratta")
  love.window.setMode(600, 400)

  background_color = {0, 0, 0}  -- Colore di sfondo

  -- Elenco delle forme disponibili
  shapes = {
    function()  -- Cerchio
      love.graphics.circle("fill", love.math.random(50, love.graphics.getWidth() - 50), love.math.random(50, love.graphics.getHeight() - 50), love.math.random(10, 50))
    end,
    function()  -- Rettangolo
      love.graphics.rectangle("fill", love.math.random(50, love.graphics.getWidth() - 100), love.math.random(50, love.graphics.getHeight() - 100), love.math.random(50, 100), love.math.random(50, 100))
    end,
    function()  -- Triangolo
      local x1, y1 = love.math.random(50, love.graphics.getWidth() - 50), love.math.random(50, love.graphics.getHeight() - 50)
      local x2, y2 = x1 + love.math.random(-50, 50), y1 + love.math.random(-50, 50)
      local x3, y3 = x1 + love.math.random(-50, 50), y1 + love.math.random(-50, 50)
      love.graphics.polygon("fill", x1, y1, x2, y2, x3, y3)
    end
  }

  -- Numero di forme da disegnare
  num_shapes = 50
end

function love.draw()
  -- Disegna lo sfondo
  love.graphics.setColor(background_color)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())

  -- Disegna le forme casuali
  for i = 1, num_shapes do
    local shape = shapes[love.math.random(1, #shapes)]
    shape()
  end
end

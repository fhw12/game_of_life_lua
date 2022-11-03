function love.load()
	shader = love.graphics.newShader('shader.glsl')
	shader:send("screen_size", {800, 600})

	canvas = love.graphics.newCanvas(800, 600)
	canvas_buffer = love.graphics.newCanvas(800, 600)

	canvas:setFilter('nearest')
	canvas_buffer:setFilter('nearest')

	love.graphics.setCanvas(canvas)
	for x = 1, 800 do
		for y = 1, 600 do
			if math.random(0, 1) == 0 then
				love.graphics.rectangle('fill', x, y, 1, 1)
			end
		end
	end
	love.graphics.setCanvas()
end

function love.draw()
	love.graphics.setColor(1, 1, 1)
	
	love.graphics.setCanvas(canvas_buffer)
	love.graphics.setShader(shader)
	love.graphics.draw(canvas, 0, 0)
	love.graphics.setShader()
	love.graphics.setCanvas()
	love.graphics.setCanvas(canvas)
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("fill", 0, 0, 800, 600)
	love.graphics.setColor(1, 1, 1)
	love.graphics.setCanvas()
	
	love.graphics.setCanvas(canvas)
	love.graphics.draw(canvas_buffer)
	love.graphics.setCanvas()
	love.graphics.setCanvas(canvas_buffer)
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("fill", 0, 0, 800, 600)
	love.graphics.setColor(1, 1, 1)
	love.graphics.setCanvas()

	love.graphics.draw(canvas, 0, 0)

	love.graphics.setColor(1, 1, 1, 0.95)
	love.graphics.rectangle('fill', 10, 10, 50, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(love.timer.getFPS(), 20, 20)
end
function love.load()
	size = 2
	map = {}
	for i = 1, 250 do
		map[i] = {}
		for j = 1, 250 do
			map[i][j] = math.random(0, 1)
		end
	end
end

function love.update()
	change = {}
end

function love.draw()
	love.graphics.setColor(1,1,1)

	for i = 1, #map do
		for j = 1, #map[i] do
			if map[i][j] == 1 then
				love.graphics.rectangle('fill', j*size-size, i*size-size, size, size)		
			end

			local sum = 0

			for ii = -1, 1 do
				for jj = -1, 1 do
					if i+ii > 0 and j+jj > 0 and i+ii <= #map and j+jj <= #map[i] and not (ii == 0 and jj == 0) then
						sum = sum + map[i+ii][j+jj]
					end
				end
			end

			if sum == 3 then
				change[#change + 1] = {i = i, j = j, pixel = 1}
			end

			if sum < 2 or sum > 3 then
				change[#change + 1] = {i = i, j = j, pixel = 0}
			end
		end
	end

	for k = 1, #change do
		map[change[k].i][change[k].j] = change[k].pixel
	end
end

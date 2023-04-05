require 'Projectile'
require 'Tween'

local start = 3

function love.load()
	love.window.setMode(1600, 900, {

	})

	love.window.setTitle('Tween')

	Projectile1 = Projectile(440, 160, 40)
	Projectile2 = Projectile(440, 460, 40)

	--GTween = Tween()
	--GTween:create(projectile1, "x", 1200 - projectile1.radius, 400 + projectile1.radius, 2, easeInCubic)
	--GTween:create(projectile1, "x", 400 + projectile1.radius, 1200 - projectile1.radius, 2, easeInCubic)
	TweenForward = Tween(Projectile1, "x", 400 + Projectile1.radius, 1200 - Projectile1.radius, 2, easeOutElastic)
	TweenBackward = Tween(Projectile1, "x", 1200 - Projectile1.radius, 400 + Projectile1.radius, 2, easeOutSine)

	P2TF = Tween(Projectile2, "x", 400 + Projectile2.radius, 1200 - Projectile2.radius, 4, easeOutElastic)
	P2TB = Tween(Projectile2, "x", 1200 - Projectile2.radius, 400 + Projectile2.radius, 4, easeOutSine)

	love.keyboard.keysPressed = {}
end

function love.keypressed(key)
	love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
	return love.keyboard.keysPressed[key]
end

function love.update(dt)
	if love.keyboard.wasPressed('escape') then
		love.event.quit()
	end

	if start == 0 then
		local complete
		complete = TweenForward:update(dt)
		complete = P2TF:update(dt)
		if complete then
			start = 2
			TweenForward:reset()
			P2TF:reset()
		end
	end
	if start == 1 then
		local complete
		complete = TweenBackward:update(dt)
		complete = P2TB:update(dt)
		if complete then
			start = 3
			TweenBackward:reset()
			P2TB:reset()
		end
	end

	if love.keyboard.wasPressed('space') then
		if start == 3 then
			start = 0
		elseif start == 2 then
			start = 1
		end
	end

	love.keyboard.keysPressed = {}
end

function love.draw()
	love.graphics.setNewFont(50)
	love.graphics.print(tostring(love.timer.getFPS()), 1500, 40)

	love.graphics.rectangle("fill", 400, 200,800, 50)
	Projectile1:render()

	love.graphics.rectangle("fill", 400, 500, 800, 50)
	Projectile2:render()
end
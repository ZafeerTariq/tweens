Class = require 'class'
require 'easingFunctions'

Projectile = Class{}

local move = false
local t = 0

function Projectile:init(x, y, r)
	self.x = x
	self.y = y
	self.dx = 500
	self.radius = r
	self.direction = 'r'
end

function Projectile:update(dt)
	-- if move then
	-- 	if self.direction == 'r' then
	-- 		self.x = lerp(400 + self.radius, 1200 - self.radius, easeInQuart(t))
	-- 		t = t + dt
	-- 	else
	-- 		self.x = lerp(1200 - self.radius, 400 + self.radius, easeInQuart(t))
	-- 		t = t + dt
	-- 	end
	-- end

	-- if t >= 1 and self.direction == 'r' then
	-- 	move = false
	-- 	self.x = 1200 - self.radius
	-- 	t = 0
	-- 	self.direction = 'l'
	-- elseif t >= 1 and self.direction == 'l' then
	-- 	move = false
	-- 	self.x = 400 + self.radius
	-- 	t = 0
	-- 	self.direction = 'r'
	-- end

	if love.keyboard.wasPressed('space') then
		move = true
	end
end

function Projectile:render()
	love.graphics.circle("fill", self.x, self.y, self.radius)
end
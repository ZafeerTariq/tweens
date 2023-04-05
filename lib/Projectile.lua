Class = require 'lib.class'

Projectile = Class{}

local move = false
local t = 0

function Projectile:init(x, y, r)
	self.x = x
	self.y = y
	self.radius = r
end

function Projectile:update(dt)

end

function Projectile:render()
	love.graphics.circle("fill", self.x, self.y, self.radius)
end
Class = require 'lib.class'

local function lerp(a, b, t)
	return a * (1 - t) + b * t
end

Tween = Class{}

function Tween:init(object, attr, from, to, duration, easingFunction)
	self.object = object
	self.from = from
	self.duration = duration
	self.to = to
	self.func = easingFunction
	self.attr = attr
	self.complete = false
	self.t = 0

	-- self.activeTweens = {}
end

-- function Tween:create(object, attr, from, to, duration, easingFunction)
-- 	self.activeTweens[#self.activeTweens + 1] = {
-- 		object = object,
-- 		attr = attr,
-- 		from = from,
-- 		to = to,
-- 		duration = duration,
-- 		func = easingFunction
-- 	}
-- end

function Tween:update(dt)
	if not self.complete then
		if self.t <= 1 then
			self.object[self.attr] = lerp(self.from, self.to, self.func(self.t))
			self.t = self.t + dt / self.duration
		else
			self.t = 0
			self.complete = true
			self.object[self.attr] = self.to
		end
	end
	return self.complete
end

function Tween:reset()
	self.complete = false
	self.t = 0
end
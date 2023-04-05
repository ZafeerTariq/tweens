function linear(t)
	return t
end

function easeInQuad(t)
	return math.pow(t, 2)
end

function easeOutQuad(t)
	return 1 - (1 - t) * (1 - t);
end

function easeInOutQuad(t)
	if t < 0.5 then
		return 2 * t * t
	else
		return 1 - math.pow(-2 * t + 2, 2) / 2
	end
end

function easeInCubic(t)
	return math.pow(t, 3)
end

function easeOutCubic(t)
	return 1 - math.pow(1 - t, 3)
end

function easeInOutCubic(t)
	if t < 0.5 then
		return 4 * math.pow(t, 3)
	else
		return 1 - math.pow(-2 * t + 2, 3) / 2
	end
end

function easeInQuart(t)
	return math.pow(t, 4)
end

function easeInSine(t)
	return 1 - math.cos((t * math.pi) / 2);
end

function easeOutSine(t)
	return math.sin((t * math.pi) / 2);
end

function easeInElastic(t)
	local c4 = (2 * math.pi) / 3;

	if t == 0 then
		return 0
	elseif t == 1 then
		return 1
	else
		return -math.pow(2, 10 * t - 10) * math.sin((t * 10 - 10.75) *  c4)
	end
end

function easeOutElastic(t)
	local c4 = (2 * math.pi) / 3;

	if t == 0 then
		return 0
	elseif t == 1 then
		return 1
	else
		return math.pow(2, -10 * t) * math.sin((t * 10 - 0.75) * c4) + 1
	end
end
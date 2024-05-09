--[[
    GD50 - 2024
    Pong Re-Remake

    -- BALL CLASS --

    Author: David Garcia
]]

Ball = Class{}

function Ball:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    -- velocity
    self.dy = 0
    self.dx = 0
end

--[[
    Arguments:
    - paddle as a paddle objetc
    Returns:
    - true or false, depending on whether their rectangles overlap.
]]
function Ball:collides(paddle)

    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end

    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're colliding
    return true
end

function Ball:reset()
    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.y = VIRTUAL_HEIGHT / 2 - (self.width / 2)
    self.dx = 0
    self.dy = 0
end

function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Ball:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
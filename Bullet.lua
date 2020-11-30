Bullet = Class{}

function Bullet:init(x, y)
    self.image = love.graphics.newImage('bullet.png')
    self.height = self.image:getHeight()
    self.width = self.image:getWidth()

    self.x = x - self.width / 2
    self.y = y 

    self.dy = 100

    self.remove = false
end

function Bullet:update(dt)
    self.y = self.y - self.dy * dt

    if self.y + self.height <= 0 then
        self.remove = true
    end
end

function Bullet:render()
    love.graphics.draw(self.image, self.x, self.y)
end

function Bullet:collides()
end


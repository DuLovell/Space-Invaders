Bullet = Class{}

function Bullet:init(x, y)
    self.image = love.graphics.newImage('bullet.png')
    self.height = self.image:getHeight()
    self.width = self.image:getWidth()

    self.damage = 10

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

function Bullet:collides(object) -------------TODO
    if self.x + self.width >= object.x and self.x <= object.x + object.width then
        if self.y <= object.y + object.height and self.y >= object.y then
            self.remove = true
            return true
        end
    end

    return false
end

function Bullet:explode() -- попробовать реализовать анимацию через итерированние по картинкам и их отрисовка
end


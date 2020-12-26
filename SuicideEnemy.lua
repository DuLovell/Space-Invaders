SuicideEnemy = Class{__includes = Enemy}

function SuicideEnemy:init(x, y, ship)
    self.image = love.graphics.newImage('suicideEnemy.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.health = 1

    self.x = x
    self.y = y

    self.remove = false
    self.ship = ship

    self.dy = 30
end


function SuicideEnemy:move(dt)
    self.x = self.x < self.ship.x and self.x + self.dy * dt or self.x - self.dy * dt
    self.y = self.y < self.ship.y and self.y + self.dy * dt or self.y - self.dy * dt
end
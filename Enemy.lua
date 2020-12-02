Enemy = Class{}

function Enemy:init(x, y)
    self.image = love.graphics.newImage('basicEnemy.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.health = 20

    self.x = x
    self.y = y

    self.remove = false
end

function Enemy:update(dt)
    if self.health <= 0 then
        self.remove = true
    end
end

function Enemy:render()
    love.graphics.draw(self.image, self.x, self.y)
end

-----------------------------
function Enemy:explode()
end
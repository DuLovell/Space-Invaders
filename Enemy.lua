Enemy = Class{}

function Enemy:init(x, y)
    self.image = love.graphics.newImage('basicEnemy.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.health = 2

    self.x = x
    self.y = y

    self.remove = false
end


function Enemy:update(dt)
    self:move(dt)

    if self.health <= 0 or self.x + self.width <= 0 or self.x >= VIRTUAL_WIDTH then
        self.remove = true
    end
end

function Enemy:render()
    love.graphics.draw(self.image, self.x, self.y)
end

-----------------------------
function Enemy:explode()
    
end

function Enemy:move(dt)
    if self.y - self.height <= VIRTUAL_HEIGHT / 2 then
        self.y = self.y + 1
    else
        if self.x <= VIRTUAL_WIDTH / 2 then
            self.x = self.x - 1
        else
            self.x = self.x + 1
        end
    end
end

Ship = Class{__includes = BaseObject}

function Ship:init()
    self.image = love.graphics.newImage('Ship25.png')
    
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.health = 3

    self.x = VIRTUAL_WIDTH / 2 - self.width / 2
    self.y = VIRTUAL_HEIGHT - self.height

    self.dy = 3 -- vertical ship velocity
    self.dx = 2 -- horizontal ship velocity
end

function Ship:update(dt)
    gControlsMachine:shipUpdate(self)   -- input handler

    if self.health <= 0 then
        gStateMachine:change('game over')
    end
end

function Ship:render()
    love.graphics.draw(self.image, self.x, self.y)
end


----------------------------------------
function Ship:moveUp() self.y = math.max(0, self.y - self.dy) end

function Ship:moveDown() self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy) end

function Ship:moveLeft() self.x = math.max(0, self.x - self.dx) end

function Ship:moveRight() self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dx) end

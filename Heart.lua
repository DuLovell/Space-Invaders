Heart = Class{}

function Heart:init(x, y, type)
    self.type = type

    self.x = x
    self.y = y

    self.fullHeartImg = love.graphics.newImage('fullHeart.png')
    self.emptyHeartImg = love.graphics.newImage('emptyHeart.png')

    self.width = self.fullHeartImg:getWidth()
    self.height = self.fullHeartImg:getHeight()
end

function Heart:render()
    if self.type == 'full' then
        love.graphics.draw(self.fullHeartImg, self.x, self.y)
    elseif self.type == 'empty' then
        love.graphics.draw(self.emptyHeartImg, self.x, self.y)
    end
end
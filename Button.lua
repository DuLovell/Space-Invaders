Button = Class{}

function Button:init(text, stateName, y, isSelected, stateObject)
    self.y = y
    self.text = text
    self.stateName = stateName
    self.isSelected = isSelected
    self.object = stateObject or {}
end


function Button:push()
    if self.stateName == 'exit' then
        love.event.quit()
    end
    gStateMachine:change(self.stateName, self.object)
end

function Button:render()
    if self.isSelected then
        love.graphics.setColorMask(true, false, true, true)
        love.graphics.printf(self.text, 0, self.y, VIRTUAL_WIDTH, 'center')
        love.graphics.setColorMask(true, true, true, true)
    else
        love.graphics.printf(self.text, 0, self.y, VIRTUAL_WIDTH, 'center')
    end
end
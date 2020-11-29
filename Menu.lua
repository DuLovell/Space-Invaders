Menu = Class{}

function Menu:init(buttons)
    self.buttons = buttons
end

function Menu:update(dt)
    gControlsMachine:menuControls(self)
end

function Menu:render()
    for state, button in pairs(self.buttons) do
        button:render()
    end
end

---------------------
function Menu:moveUp()
    for i, button in ipairs(self.buttons) do
        if button.isSelected then
            self.buttons[i].isSelected = false
            self.buttons[i ~= #self.buttons and i + 1 or 1].isSelected = true
            break
        end
    end
end

function Menu:moveDown()
    for i, button in ipairs(self.buttons) do
        if button.isSelected then
            self.buttons[i].isSelected = false
            self.buttons[i ~= 1 and i - 1 or #self.buttons].isSelected = true
            break
        end
    end
end

function Menu:select()
    for i, button in ipairs(self.buttons) do
        if button.isSelected then
            button:push()
            break
        end
    end
end
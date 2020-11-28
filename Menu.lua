Menu = Class{}

function Menu:init()
    self.buttons = {
        Button('EXIT', 'exit', 180, false),
        Button('CONTROLS', 'controls', 165, false),
        Button('START', 'play', 150, true)
    }
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
            self.buttons[i ~= 3 and i + 1 or 1].isSelected = true
            break
        end
    end
end

function Menu:moveDown()
    for i, button in ipairs(self.buttons) do
        if button.isSelected then
            self.buttons[i].isSelected = false
            self.buttons[i ~= 1 and i - 1 or 3].isSelected = true
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
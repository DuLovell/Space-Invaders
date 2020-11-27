TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()
    titleFont = love.graphics.newFont('arcade_classic.ttf', 30, 'none')
    menuFont = love.graphics.newFont('arcade_classic.ttf', 15, 'normal')


    self.buttons = {false, false, true}
end


function TitleScreenState:enter(params)

end

function TitleScreenState:update(dt)
    gControlsMachine:mainMenu(self)
end

function TitleScreenState:render()
    love.graphics.setFont(titleFont)
    love.graphics.printf('Space Invaders', 0, 30, VIRTUAL_WIDTH, 'center')
    
    love.graphics.setFont(menuFont)

    if self.buttons[3] then
        love.graphics.setColorMask(true, false, true, true)
        love.graphics.printf('Start', 0, 150, VIRTUAL_WIDTH, 'center')
        love.graphics.setColorMask(true, true, true, true)
        love.graphics.printf('Contro ls', 0, 165, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Exit', 0, 180, VIRTUAL_WIDTH, 'center')
    elseif self.buttons[2] then
        love.graphics.printf('Start', 0, 150, VIRTUAL_WIDTH, 'center')
        love.graphics.setColorMask(true, false, true, true)
        love.graphics.printf('Contro ls', 0, 165, VIRTUAL_WIDTH, 'center')
        love.graphics.setColorMask(true, true, true, true)
        love.graphics.printf('Exit', 0, 180, VIRTUAL_WIDTH, 'center')
    elseif self.buttons[1] then
        love.graphics.printf('Start', 0, 150, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Contro ls', 0, 165, VIRTUAL_WIDTH, 'center')
        love.graphics.setColorMask(true, false, true, true)
        love.graphics.printf('Exit', 0, 180, VIRTUAL_WIDTH, 'center') 
        love.graphics.setColorMask(true, true, true, true)
    end

end


function TitleScreenState:exit()

end

function TitleScreenState:moveUp()
    for i, value in pairs(self.buttons) do
        if value then
            self.buttons[i], self.buttons[i ~= 3 and (i + 1) % 4 or 1] = false, true
            break
        end
    end
end

function TitleScreenState:moveDown()
    for i, value in pairs(self.buttons) do
        if value then
            self.buttons[i], self.buttons[i ~= 1 and math.abs(i - 1) or 3] = false, true
            break
        end
    end
end
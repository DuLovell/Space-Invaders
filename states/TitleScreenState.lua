TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()
    titleFont = love.graphics.newFont('arcade_classic.ttf', 30, 'none')
    menuFont = love.graphics.newFont('arcade_classic.ttf', 15, 'normal')
    self.menu = Menu({
        Button('EXIT', 'exit', 180, false),
        Button('CONTROLS', 'controls', 165, false),
        Button('START', 'play', 150, true)
    })
end


function TitleScreenState:enter(params)

end

function TitleScreenState:update(dt)
    self.menu:update(dt)
end

function TitleScreenState:render()
    love.graphics.setFont(titleFont)
    love.graphics.printf('Space Invaders', 0, 30, VIRTUAL_WIDTH, 'center')
    
    love.graphics.setFont(menuFont)

    self.menu:render()

end


function TitleScreenState:exit()

end

TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()
    self.menu = Menu({
        Button('EXIT', 'exit', 180, false),
        Button('CONTROLS', 'controls', 165, false),
        Button('START', 'play', 150, true)
    })
end


function TitleScreenState:enter(params)
    IS_GAME_STARTED = false
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

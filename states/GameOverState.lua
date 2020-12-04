GameOverState = Class{__includes = BaseState}

function GameOverState:enter()
    self.menu = Menu({
        Button('EXIT', 'exit', 180, false),
        Button('MAIN  MENU', 'title', 165, false),
        Button('PLAY  AGAIN', 'play', 150, true),
    })
end

function GameOverState:update(dt)
    self.menu:update(dt)
end

function GameOverState:render()
    love.graphics.setFont(titleFont)
    love.graphics.printf('Game  over', 0, 60, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(menuFont)
    self.menu:render()
end
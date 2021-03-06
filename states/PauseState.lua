PauseState = Class{__includes = BaseState}

function PauseState:enter()
    SOUNDS['pause']:play()
    
    self.menu = Menu({
        Button('MAIN  MENU', 'title', 140, false),
        Button('CONTROLS', 'controls', 125, false),
        Button('RESUME', 'play', 110, true, gPlayObject)
    })
end

function PauseState:update(dt)
    self.menu:update(dt)
end

function PauseState:render()
    self.menu:render()
end


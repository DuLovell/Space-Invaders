PauseState = Class{__includes = BaseState}

function PauseState:enter(stateObject)
    self.menu = Menu({
        Button('EXIT', 'exit', 140, false),
        Button('CONTROLS', 'controls', 125, false),
        Button('RESUME', 'play', 110, true, stateObject)
    })
end

function PauseState:update(dt)
    self.menu:update(dt)
end

function PauseState:render()
    self.menu:render()
end


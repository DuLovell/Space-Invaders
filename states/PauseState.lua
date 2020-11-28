PauseState = Class{__includes = BaseState}

function PauseState:enter(stateObject)
    self.playStateObject = stateObject
    self.menu = Menu()
end

function PauseState:update(dt)
    self.menu:update(dt)
end

function PauseState:render()
    self.menu:render()
end

function PauseState:exit()
    gStateMachine:change('play', {self.playStateObject})
end
PlayState = Class{__includes = {BaseState, BaseObject}}

function PlayState:enter(stateObject)
    self.ship = stateObject.ship or Ship()
end


function PlayState:update(dt)
    self.ship:update(dt)
    gControlsMachine:playStateControls(self)
end


function PlayState:render()
    self.ship:render()
end

function PlayState:pause()
    gStateMachine:change('pause', self)
end


function PlayState:exit()

end
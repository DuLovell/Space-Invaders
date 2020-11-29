PlayState = Class{__includes = {BaseState, BaseObject}}



function PlayState:init()
    gPlayObject = self
    IS_GAME_STARTED = true
end

function PlayState:enter(stateObject)
    self.ship = stateObject.ship or Ship()

end


function PlayState:update(dt)
    self.ship:update(dt)
    gControlsMachine:playStateControls()
end


function PlayState:render()
    self.ship:render()
end

function PlayState:pause()

    gStateMachine:change('pause', self)
end


function PlayState:exit()

end
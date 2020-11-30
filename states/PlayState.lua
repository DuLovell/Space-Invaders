PlayState = Class{__includes = {BaseState, BaseObject}}



function PlayState:init()
    gPlayObject = self
    IS_GAME_STARTED = true
end

function PlayState:enter(stateObject)
    self.ship = stateObject.ship or Ship()
    self.shooting = stateObject.shooting or Shooting()
end


function PlayState:update(dt)
    self.ship:update(dt)
    self.shooting:update(dt, self.ship)
    gControlsMachine:playStateControls()
end


function PlayState:render()
    self.shooting:render()
    self.ship:render()
end

function PlayState:pause()

    gStateMachine:change('pause', self)
end


function PlayState:exit()

end
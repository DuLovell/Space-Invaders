PlayState = Class{__includes = {BaseState, BaseObject}}



function PlayState:init()
    gPlayObject = self
    IS_GAME_STARTED = true
end

function PlayState:enter(stateObject)
    self.ship = stateObject.ship or Ship()
    self.shootingShip = stateObject.shootingShip or Shooting()
    self.enemies = stateObject.enemies or Enemies()
end


function PlayState:update(dt)
    self.ship:update(dt)
    self.shootingShip:update(dt, self.ship, self.enemies.enemies)
    gControlsMachine:playStateControls()
    self.enemies:update(dt)
end


function PlayState:render()
    self.enemies:render()
    self.shootingShip:render()
    self.ship:render()
end

function PlayState:pause()

    gStateMachine:change('pause', self)
end


function PlayState:exit()

end
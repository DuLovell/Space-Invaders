PlayState = Class{__includes = {BaseState, BaseObject}}



function PlayState:init()
    gPlayObject = self
    IS_GAME_STARTED = true
end

function PlayState:enter(stateObject)
    self.ship = stateObject.ship or Ship()
    self.shootingShip = stateObject.shootingShip or Shooting('user')
    self.enemies = stateObject.enemies or Enemies(self.ship)
    
    self.shootingEnemy = {}
    for i = 0, 20, 1 do
        table.insert(self.shootingEnemy, 1, Shooting('enemy'))
    end
end


function PlayState:update(dt)
    self.ship:update(dt)
    self.shootingShip:update(dt, self.ship, self.enemies.enemies)
    gControlsMachine:playStateControls()
    self.enemies:update(dt, self.ship)

    for i, enemy in ipairs(self.enemies.enemies) do
        self.shootingEnemy[i]:update(dt, enemy, {self.ship})

    end
    
    for i = #self.enemies.enemies + 1, #self.shootingEnemy, 1 do
        self.shootingEnemy[i]:update(dt, nil, {self.ship})
    end
end


function PlayState:render()
    for i, shooting in ipairs(self.shootingEnemy) do
        shooting:render()
    end
    self.enemies:render()
    self.shootingShip:render()
    self.ship:render()
end

function PlayState:pause()

    gStateMachine:change('pause', self)
end


function PlayState:exit()

end
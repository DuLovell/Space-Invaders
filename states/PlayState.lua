PlayState = Class{__includes = {BaseState, BaseObject}}

function PlayState:init()
    gPlayObject = self
    IS_GAME_STARTED = true
    self.heart = Heart() -- for width and height values of Heart objects

end

    
function PlayState:enter(stateObject)
    self.ship = stateObject.ship or Ship()
    self.shootingShip = stateObject.shootingShip or Shooting('user')
    self.enemies = stateObject.enemies or Enemies(self.ship)

    self.hearts = {}
    for i = 1, self.ship.health, 1 do
        table.insert(self.hearts, Heart(100 + self.heart.width * i, 7, 'full'))
    end
    
    self.shootingEnemy = {}
    for i = 0, 10, 1 do
        table.insert(self.shootingEnemy, 1, Shooting('enemy'))
    end
end

function PlayState:update(dt)
    self.ship:update(dt)
    self.shootingShip:update(dt, self.ship, self.enemies.enemies, self.enemies.suicideEnemies)
    gControlsMachine:playStateControls()
    self.enemies:update(dt, self.ship)
    self:manageHearts()



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

    for i, heart in ipairs(self.hearts) do
        heart:render()
    end
end

function PlayState:pause()

    gStateMachine:change('pause', self)
end

function PlayState:exit()
end

function PlayState:manageHearts()
    for i = 3, self.ship.health + 1, -1 do
        if i >= 0 then
            self.hearts[i].type = 'empty'
        end
    end
end
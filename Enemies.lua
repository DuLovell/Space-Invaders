Enemies = Class{}

function Enemies:init(ship)
    self.timer = 0
    self.enemies = {}
    self.suicideEnemies = {}

    self.ship = ship
    self.enemy = Enemy() -- объект класса для использования параметров модели Enemy
end

function Enemies:update(dt)
    self.timer = self.timer + dt

    if self.timer > math.random(5) then
        table.insert(self.enemies, 1, Enemy(math.random(VIRTUAL_WIDTH - self.enemy.width), -self.enemy.height))
        suicideX = math.random(-50, -self.enemy.width)
        suicideY = math.random(VIRTUAL_HEIGHT / 3, VIRTUAL_HEIGHT / 2)
        table.insert(self.suicideEnemies, 1, SuicideEnemy(suicideX, suicideY, self.ship)) --- изменить значения под индивидуальную высоту и ширину модели врага
        self.timer = 0
    end


    ----------------------------------------- basicEnemy update
    for i, enemy in ipairs(self.enemies) do
        if enemy.remove then
            table.remove(self.enemies, i)
        end
    end

    for i, enemy in ipairs(self.enemies) do
        if enemy:collides(self.ship) then
            self.ship.health = self.ship.health - 1
            enemy.remove = true
        end
        enemy:update(dt)
    end

    ------------------------------------------- suicideEnemy update
    for i, suicideEnemy in ipairs(self.suicideEnemies) do
        if suicideEnemy:collides(self.ship) then
            self.ship.health = self.ship.health - 1
            suicideEnemy.remove = true
        end
        suicideEnemy:update(dt)
    end
    for i, suicideEnemy in ipairs(self.suicideEnemies) do
        if suicideEnemy.remove then
            table.remove(self.suicideEnemies, i)
        end
    end
end

function Enemies:render()
    for i, enemy in ipairs(self.enemies) do
        enemy:render()
    end
    for i, suicideEnemy in ipairs(self.suicideEnemies) do
        suicideEnemy:render()
    end
end

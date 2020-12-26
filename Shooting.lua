Shooting = Class{}

function Shooting:init(type)
    self.timer = 0
    self.bullets = {}
    self.type = type
end

function Shooting:update(dt, ship, enemies, suicideEnemies) -- enemies это таблица врагов из класса Enemies
    local suicideEnemies = suicideEnemies or {} 

    self.timer = self.timer + dt

    if  self.timer > 0.3  and self.type == 'user' and ship then
        table.insert(self.bullets, Bullet(ship.x + ship.width / 2, ship.y, self.type))
        self.timer = 0
    elseif  self.timer > 0.5 and self.type == 'enemy' and ship then
        table.insert(self.bullets, Bullet(ship.x + ship.width / 2, ship.y, self.type))
        self.timer = 0
    elseif not ship then
        self.timer = 0
    end

    for i, bullet in ipairs(self.bullets) do
        if bullet.remove then
            table.remove(self.bullets, i)
        end
    end

    for i, bullet in ipairs(self.bullets) do -- итерируясь по объектам Bullet итерируемся по объектам Enemy и проверяем для Bullet столкновение с каждым Enemy 
        for k, enemy in pairs(enemies) do
            if bullet:collides(enemy) then
                enemy.health = enemy.health - bullet.damage
            end
        end

        for k, suicideEnemy in pairs(suicideEnemies) do
            if bullet:collides(suicideEnemy) then
                suicideEnemy.health = suicideEnemy.health - bullet.damage
            end
        end

        bullet:update(dt)
    end
end

function Shooting:render()
    for i, bullet in ipairs(self.bullets) do
        bullet:render()
    end
end
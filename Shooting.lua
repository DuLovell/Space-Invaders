Shooting = Class{}

function Shooting:init()
    self.timer = 0
    self.bullets = {}

end

function Shooting:update(dt, ship, enemies) -- enemies это таблица врагов из класса Enemies
    self.timer = self.timer + dt
    if self.timer > 0.3 then
        
        table.insert(self.bullets, Bullet(ship.x + ship.width / 2, ship.y))
        self.timer = 0
    end

    for k, bullet in pairs(self.bullets) do
        if bullet.remove then
            table.remove(self.bullets, k)
        end
    end

    for i, bullet in ipairs(self.bullets) do -- итерируясь по объектам Bullet итерируемся по объектам Enemy и проверяем для Bullet столкновение с каждым Enemy 
        for k, enemy in pairs(enemies) do
            if bullet:collides(enemy) then
                enemy.health = enemy.health - bullet.damage
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
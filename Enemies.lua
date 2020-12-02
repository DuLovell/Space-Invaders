Enemies = Class{}

function Enemies:init()
    self.timer = 0
    self.enemies = {}

    self.ship = ship
    self.enemy = Enemy() -- объект класса для использования параметров модели Enemy
end

function Enemies:update(dt)
    self.timer = self.timer + dt

    if self.timer > math.random(5) then
        table.insert(self.enemies, Enemy(math.random(VIRTUAL_WIDTH - self.enemy.width), -self.enemy.height, self.ship)) --- изменить значения под индивидуальную высоту и ширину модели врага
        self.timer = 0
    end

    for k, enemy in pairs(self.enemies) do
        if enemy.remove then
            table.remove(self.enemies, k)
        end
    end

    for k, enemy in pairs(self.enemies) do
        enemy:update(dt)
    end
end

function Enemies:render()
    for k, enemy in pairs(self.enemies) do
        enemy:render()
    end
end

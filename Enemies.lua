Enemies = Class{}

function Enemies:init()
    self.timer = 0
    self.enemies = {}
end

function Enemies:update(dt)
    self.timer = self.timer + dt

    if self.timer > math.random(5) then
        table.insert(self.enemies, Enemy(math.random(VIRTUAL_WIDTH - 25), math.random(VIRTUAL_HEIGHT / 2)))
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

Shooting = Class{}

function Shooting:init()
    self.timer = 0
    self.bullets = {}

end

function Shooting:update(dt, ship)
    self.timer = self.timer + dt
    if self.timer > 0.3 then
        
        table.insert(self.bullets, Bullet(ship.x + ship.width /2, ship.y))
        self.timer = 0
    end

    for k, bullet in pairs(self.bullets) do
        if bullet.remove then
            table.remove(self.bullets, k)
        end
    end

    for i, bullet in ipairs(self.bullets) do

        bullet:update(dt)
    end
end

function Shooting:render()
    for i, bullet in ipairs(self.bullets) do
        bullet:render()
    end
end
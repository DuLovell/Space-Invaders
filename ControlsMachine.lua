ControlsMachine = Class{}

function ControlsMachine:init(controls)
    --[[self.empty = { НЕ ЯСНА НЕОБХОДИМОСТЬ self.empty
        moveUp = function() end,
        moveDown = function() end,
        moveLeft = function() end,
        moveRight = function() end,
        shoot = function() end
    }
    self.controls = controls or {}
    self.current = self.empty]]
    self.controls = controls or {}
    self.current = {}

end

function ControlsMachine:userControls(classObject)
    self.current = classObject
    
    -- conditions
    if love.keyboard.isDown(self.controls['up']) then
        self.current:moveUp()
    elseif love.keyboard.isDown(self.controls['down']) then
        self.current:moveDown()
    elseif love.keyboard.isDown(self.controls['left']) then
        self.current:moveLeft()
    elseif love.keyboard.isDown(self.controls['right']) then
        self.current:moveRight()
    -- подумать над переключением режима стрельбы на кнопку
    elseif love.keyboard.wasPressed(self.controls['shoot']) then
        self.current:shoot()
    end
end

function ControlsMachine:mainMenu(classObject)
    self.current = classObject

    -- conditions
    if love.keyboard.wasPressed(self.controls['up']) then
        self.current:moveUp()
    elseif love.keyboard.wasPressed(self.controls['down']) then
        self.current:moveDown()
    end
end
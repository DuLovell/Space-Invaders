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
    self.controls = controls
    self.current = {}

end

function ControlsMachine:shipUpdate(classObject)
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

function ControlsMachine:menuControls(classObject)
    self.current = classObject

    -- conditions
    if love.keyboard.wasPressed(self.controls['up']) then
        self.current:moveUp()
    elseif love.keyboard.wasPressed(self.controls['down']) then
        self.current:moveDown()
    elseif love.keyboard.wasPressed(self.controls['select']) then
        self.current:select()
    end
end

function ControlsMachine:playStateControls(classObject)
    self.current = classObject

    if love.keyboard.wasPressed(self.controls['pause']) then
        self.current:pause()
    end
end

function ControlsMachine:controlChange(classObject)
    self.current = classObject
    if LAST_PRESSED_KEY then
        self.current:changeControl(LAST_PRESSED_KEY)
    end
end
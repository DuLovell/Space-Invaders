ControlsState = Class{__includes = BaseState}

 counter = 15

function ControlsState:init()
    self.buttons = {}
    
    for action, button in pairs(CONTROLS) do
        table.insert(self.buttons, 1, Button(string.format("%s   %q", action, button), 'controlsChange', 60 + counter, false, action))
        counter = counter + 15
    end
   
    if IS_GAME_STARTED then
        table.insert(self.buttons, 1, Button('BACK', 'pause', 90 + counter, true))
    else
        table.insert(self.buttons, 1, Button('BACK', 'title', 90 + counter, true))
    end
    
    --table.insert(self.buttons, 1, Button('EXIT', 'title', 105 + counter, false))

    self.menu = Menu(self.buttons)
end

function ControlsState:enter(controlToChange)
    
end

function ControlsState:update(dt)
    self.menu:update(dt)
end

function ControlsState:render()
    self.menu:render()
end

function ControlsState:exit()
    counter = 15
end
ControlsState = Class{__includes = BaseState}

local counter = 15

function ControlsState:init()
    self.buttons = {}
    
    for action, button in pairs(CONTROLS) do
        table.insert(self.buttons, 1, Button(string.format("%s   %q", action, button), 'controlsChange', 90 + counter, false, action))
        counter = counter + 15
    end
    table.insert(self.buttons, 1, Button('BACK', 'title', 90 + counter, true))
    table.insert(self.buttons, 1, Button('EXIT', 'exit', 105 + counter, false))

    self.menu = Menu(self.buttons)
end

function ControlsState:enter(controlToChange)
    self.actionToChange = controlToChange or nil
    
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
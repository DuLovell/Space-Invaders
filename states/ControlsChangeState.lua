ControlsChangeState = Class{__includes = BaseState}

function ControlsChangeState:enter(actionToChange)
    self.actionToChange = actionToChange
end

function ControlsChangeState:update(dt)
    gControlsMachine:controlChange(self)
end

function ControlsChangeState:render()
    love.graphics.printf("Press  a  key", 0, 120, VIRTUAL_WIDTH, 'center')
end

function ControlsChangeState:changeControl(key)
    CONTROLS[self.actionToChange] = key
    gStateMachine:change('controls')
end

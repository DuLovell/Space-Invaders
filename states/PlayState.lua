PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
    self.ship = Ship()
end


function PlayState:update(dt)
    self.ship:update(dt)
end


function PlayState:render()
    self.ship:render()
end


function PlayState:exit()

end
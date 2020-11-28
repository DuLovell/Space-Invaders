push = require 'push'

Class = require 'class'
require 'StateMachine'
require 'ControlsMachine'
require 'BaseObject'

require 'states/BaseState'
require 'states/PlayState'
require 'states/TitleScreenState'
require 'states/PauseState'

require 'Ship'
require 'Button'
require 'Menu'

WINDOW_WIDTH = 405
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 144
VIRTUAL_HEIGHT = 256

background = love.graphics.newImage('background.png')

 -- background size: 144x796
backgroundScroll = -796 + VIRTUAL_HEIGHT
BACKGROUND_SCROLL_SPEED = 30
BACKGROUND_LOOPING_POINT = -398

scrolling = true;

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{
        vsync = true,
        resizable = true,
        fullscreen = false
    })

    love.window.setTitle('Space Invaders')

    -- setup fonts
    

    -- setup StateMachine
    gStateMachine = StateMachine{
        ['play'] = function() return PlayState() end,
        ['title'] = function() return TitleScreenState() end,
        ['pause'] = function() return PauseState() end
    }

    -- setup ControlsMachine (initialize control settings)
    gControlsMachine = ControlsMachine {
        ['up'] = 'w',
        ['down'] = 's',
        ['left'] = 'a',
        ['right'] = 'd',
        ['shoot'] = 'space',
        ['select'] = 'return',
        ['pause'] = 'escape'
    }
    gStateMachine:change('title')
    -- setup Keys Pressed table
    love.keyboard.keysPressed = {}

    -- TODO: setup mouse input table
    

end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    if  scrolling then
        backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT       
        gStateMachine:update(dt)
        
    end
    love.keyboard.keysPressed = {}
end  

function love.draw()
    push:start()
    love.graphics.draw(background, 0, backgroundScroll)
    gStateMachine:render()
    push:finish()
end
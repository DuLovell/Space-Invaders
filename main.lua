push = require 'push'

Class = require 'class'
require 'StateMachine'
require 'ControlsMachine'
require 'BaseObject'

require 'states/BaseState'
require 'states/PlayState'

require 'Ship'

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
    titleFont = love.graphics.newFont('arcade_classic.ttf', 100)

    -- setup StateMachine
    gStateMachine = StateMachine{
        ['play'] = function() return PlayState() end
    }

    -- setup ControlsMachine (initialize control settings)
    gControlsMachine = ControlsMachine {
        ['up'] = 'w',
        ['down'] = 's',
        ['left'] = 'a',
        ['right'] = 'd',
        ['shoot'] = 'space'
    }
    gStateMachine:change('play')
    -- setup Keys Pressed table
    love.keyboard.keysPressed = {}

    -- setup mouse input table
    

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
        --love.mouse.setVisible(false) -- делает курсор невидимым
        backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT       
        gStateMachine:update(dt)
        
    end

end  

function love.draw()
    push:start()
    love.graphics.draw(background, 0, backgroundScroll)
    gStateMachine:render()
    push:finish()
end
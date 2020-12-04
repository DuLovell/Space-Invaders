push = require 'push'

Class = require 'class'
require 'StateMachine'
require 'ControlsMachine'
require 'BaseObject'

require 'states/BaseState'
require 'states/PlayState'
require 'states/TitleScreenState'
require 'states/PauseState'
require 'states/ControlsState'
require 'states/ControlsChangeState'
require 'states/GameOverState'

require 'Ship'
require 'Button'
require 'Menu'
require 'Bullet'
require 'Shooting'
require 'Enemies'
require 'Enemy'

WINDOW_WIDTH = 405
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 144
VIRTUAL_HEIGHT = 256

background = love.graphics.newImage('background.png')

 -- background size: 144x796
backgroundScroll = -796 + VIRTUAL_HEIGHT
BACKGROUND_SCROLL_SPEED = 30
BACKGROUND_LOOPING_POINT = -398



scrolling = true

CONTROLS = {
    ['down'] = 's',
    ['up'] = 'w',
    ['pause'] = 'escape',
    ['shoot'] = 'space',
    ['right'] = 'd',
    ['select'] = 'return',
    ['left'] = 'a',
}

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    IS_GAME_STARTED = false
    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{
        vsync = true,
        resizable = true,
        fullscreen = false
    })

    love.window.setTitle('Space Invaders')

    -- fonts
    titleFont = love.graphics.newFont('arcade_classic.ttf', 30, 'none')
    menuFont = love.graphics.newFont('arcade_classic.ttf', 15, 'normal')

    math.randomseed(os.time())
   
    

    -- setup StateMachine
    gStateMachine = StateMachine{
        ['play'] = function() return PlayState() end,
        ['title'] = function() return TitleScreenState() end,
        ['pause'] = function() return PauseState() end,
        ['controls'] = function() return ControlsState() end,
        ['controlsChange'] = function() return ControlsChangeState() end,
        ['game over'] = function() return GameOverState() end
    }

    -- setup ControlsMachine (initialize control settings)
    gControlsMachine = ControlsMachine(CONTROLS)
    gStateMachine:change('title')
    -- setup Keys Pressed table
    love.keyboard.keysPressed = {}

    -- TODO: setup mouse input table
    

end

function love.textinput(t)
    text = t
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true

    LAST_PRESSED_KEY = key
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

    LAST_PRESSED_KEY = nil
end  

function love.draw()
    push:start()
    love.graphics.draw(background, 0, backgroundScroll)
    gStateMachine:render()
    push:finish()
end
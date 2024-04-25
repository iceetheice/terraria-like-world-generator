worldGenerator = require "worldGenerator"


function love.load()
    math.randomseed(os.time())
    love.graphics.setDefaultFilter("nearest", "nearest")
    background = love.graphics.newImage("assets/background.jpg")
    world = {}
end

function love.update(dt)
    if love.mouse.isDown(1) then
        world = worldGenerator:genWorld()
    end
end

function love.draw()
    love.graphics.draw(background)
    love.graphics.push()
    love.graphics.scale(3)
    worldGenerator:drawGeneratedWorld(world)
    love.graphics.pop()
end
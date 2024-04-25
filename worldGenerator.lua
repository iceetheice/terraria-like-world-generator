worldGenerator = {}
grassImage = love.graphics.newImage("assets/blocks/grass.png")
grassImage:setFilter("nearest", "nearest")
groundImage = love.graphics.newImage("assets/blocks/ground.png")
groundImage:setFilter("nearest", "nearest")


math.randomseed(os.time())
function worldGenerator:genWorld()
    local worldHeight = 300
    local worldWidth = 1000
    local blockSize = 8 -- pixels
    local groundSurface = 20
    local worldData = {}
    for yPos = 0, worldHeight do
        for xPos = 0, worldWidth do
            targetX = xPos * blockSize
            targetY = yPos * blockSize
            height = love.math.noise((xPos + math.random(1, 1000))/200, 0) * 5

            local blockType
            if yPos > groundSurface - math.floor(height) then
                blockType = 2 -- ground
            elseif yPos == groundSurface - math.floor(height) then
                blockType = 1 -- grass
            else
                blockType = 0 -- air
            end
            
            if blockType ~= 0 then
                table.insert(worldData, {x = targetX, y = targetY, blockType = blockType})
            end
        end
    end
    return worldData
end

function worldGenerator:drawGeneratedWorld(world)
    for _, block in ipairs(world) do
        if block.blockType == 1 then
            love.graphics.draw(grassImage, block.x, block.y)
        elseif block.blockType == 2 then
            love.graphics.draw(groundImage, block.x, block.y)
        end
    end
end

return worldGenerator
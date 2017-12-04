io.input( "day3-input.txt" )

io.write( "Please enter your puzzle input: \n" )
local input = io.read()

local direction

local function turnLeft()
    if direction.x == 1 then
        direction = { x = 0, y = 1 }
    elseif direction.y == 1 then
        direction = { x = -1, y = 0 }
    elseif direction.x == -1 then
        direction = { x = 0, y = -1 }
    elseif direction.y == -1 then
        direction = { x = 1, y = 0 }
    end
end

local x = 0
local y = 0
local size = 1
local leg = 1
local step = 0

direction = { x = 1, y = 0 }

for i = 2, string.match( input, "%d+" ) do
    x = x + direction.x
    y = y + direction.y
    --print( x, y )
    
    step = step + 1
    
    if step == size then
        turnLeft()
        if leg == 1 then
            leg = 2
        elseif leg == 2 then
            size = size + 1
            leg = 1
        end
        step = 0
    end
end

local distance = math.abs( x ) + math.abs( y )

io.write( distance, " steps are required" )

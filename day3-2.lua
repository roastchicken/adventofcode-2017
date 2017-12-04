io.input( "day3-input.txt" )

io.write( "Please enter your puzzle input: \n" )
local input = tonumber( string.match( io.read(), "%d+" ) )

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
local sum = 0
local memory = { [ 0 ] = { [ 0 ] = 1 } } 

direction = { x = 1, y = 0 }

while not ( sum > input ) do
    x = x + direction.x
    y = y + direction.y
    
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
    
    sum = 0
    
    for xPos = x - 1, x + 1 do
        for yPos = y - 1, y + 1 do
            if memory[ xPos ] and memory[ xPos ][ yPos ] then
                sum = sum + memory[ xPos ][ yPos ]
            end
        end
    end
    
    if not memory[ x ] then
        memory[ x ] = {}
    end
    
    memory[ x ][ y ] = sum
    -- print( x, y, sum )
end

--[[
-- print out the memory. a bit inefficient because the table dimensions are in the opposite order that they're printed
for yPos = 10, -10, -1 do
    for xPos = -10, 10 do
        if memory[ xPos ] and memory[ xPos ][ yPos ] then
            io.write( tostring( memory[ xPos ][ yPos ] ), "\t" )
        end
    end
    io.write( "\n" )
end
]]

io.write( memory[ x ][ y ], " is the first value written larger than ", input )

io.input( "day5-input.txt" )

io.write( "Please enter your puzzle input: \n" )

local instructions = {}

for line in io.lines() do
    line = tonumber( line )
    table.insert( instructions, line )
end

local step = 0
local i = 1

while 0 < i and i <= #instructions do
    local instruction = instructions[ i ]
    -- print( i, instruction )
    if instruction >= 3 then
        instructions[ i ] = instruction - 1
    else
        instructions[ i ] = instruction + 1
    end
    i = i + instruction
    -- print( "next:", i )
    step = step + 1
end

io.write( "It took ", step, " steps to reach the exit" )

io.input( "day1-input.txt" )

io.write( "Please enter your puzzle input:\n" )
local input = io.read()

local length = string.len( input )
local sum = 0

for i = 1, length do
    local number1 = string.sub( input, i, i )
    local halfWay = i + ( length / 2 )
    if halfWay > length then
        halfWay = halfWay - length
    end
    -- print( "halfWay = ", halfWay )
    local number2 = string.sub( input, halfWay, halfWay )
    -- print( number1, number2 )
    if number1 == number2 then
        sum = sum + number1
    end
end

io.write( "The sum is ", sum )
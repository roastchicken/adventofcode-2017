io.input( "day1-input.txt" )

io.write( "Please enter your puzzle input:\n" )
local input = io.read()

local sum = 0
local number1
local lastNumber

for number2 in string.gmatch( input, "%d" ) do
    if number1 then
        -- print( number1, number2 )
        if number1 == number2 then
            sum = sum + number1
        end
    end
    number1 = number2
    lastNumber = number2
end

-- check if the last number matches the very fist number, because the list is circular and wraps around
local firstNumber = string.match( input, "%d" )
if lastNumber == firstNumber then
    sum = sum + lastNumber
end

io.write( "The sum is ", sum )

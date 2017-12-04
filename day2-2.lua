io.input( "day2-input.txt" )

io.write( "Please enter your puzzle input: (end of file with Ctrl-Z)\n" )

local checksum = 0

for line in io.lines() do
    local numbers = {}
    for number1 in string.gmatch( line, "(%d+)%s*" ) do
        number1 = tonumber( number1 ) -- otherwise the numbers will be treated as strings when using order operators ( < and > ), resulting in alphabetical order
        for k, number2 in pairs( numbers ) do
            number2 = tonumber( number2 ) -- otherwise the numbers will be treated as strings when using order operators ( < and > ), resulting in alphabetical order
            if number1 > number2 and number1 % number2 == 0 then
                checksum = checksum + number1 / number2
                -- print( number2 .. " evenly divides " .. number1 .. " into " .. number1 / number2 )
                break
            elseif number1 < number2 and number2 % number1 == 0 then
                checksum = checksum + number2 / number1
                -- print( number1 .. " evenly divides " .. number2 .. " into " .. number2 / number1 )
                break
            end
        end
        table.insert( numbers, number1 )
    end
end

io.write( "The checksum is ", checksum )

io.input( "day2-input.txt" )

io.write( "Please enter your puzzle input: (end of file with Ctrl-Z)\n" )

local checksum = 0

for line in io.lines() do
    local min
    local max
    for number in string.gmatch( line, "(%d+)%s*" ) do
        number = tonumber( number )
        min = min or number
        if number < min then
            min = number
        end
        max = max or number
        if number > max then
            max = number
        end
    end
    -- print( min, max )
    checksum = checksum + ( max - min )
end

io.write( "The checksum is ", checksum )

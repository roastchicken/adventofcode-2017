io.input( "day4-input.txt" )

io.write( "Please enter your puzzle input: (end of file with Ctrl-Z)\n" )

local numValid = 0

for line in io.lines() do
    local words = {}
    local valid = true
    for word1 in string.gmatch( line, "%l+" ) do
        for k, word2 in pairs( words ) do
            if word1 == word2 then
                valid = false
                break
            end
        end
        if not valid then
            break
        end
        table.insert( words, word1 )
    end
    if valid then
        numValid = numValid + 1
    end
end

io.write( numValid, " passphrases are valid." )

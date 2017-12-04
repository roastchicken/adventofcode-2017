io.input( "day4-input.txt" )

io.write( "Please enter your puzzle input: (end of file with Ctrl-Z)\n" )

local function countLetters( str )
    local letters = {}
    for letter in string.gmatch( str, "%l" ) do
        if not letters[ letter ] then
            letters[ letter ] = 0
        end
        letters[ letter ] = letters[ letter ] + 1
    end
    
    return letters
end

local function isAnagram( letters1, letters2 )
    local anagram = true
    for letter in pairs( letters1 ) do
        if not letters2[ letter ] or letters1[ letter ] ~= letters2[ letter ] then
            anagram = false
            break
        end
    end
    
    for letter in pairs( letters2 ) do
        if not letters1[ letter ] or letters1[ letter ] ~= letters2[ letter ] then
            anagram = false
            break
        end
    end
    
    return anagram
end

local numValid = 0

for line in io.lines() do
    local words = {}
    local wordLetters = {}
    local valid = true
    for word1 in string.gmatch( line, "%l+" ) do
        local letters1 = countLetters( word1 )
        for k, word2 in pairs( words ) do
            local letters2 = wordLetters[ k ]
            if word1 == word2 then
                valid = false
                break
            elseif isAnagram( letters1, letters2 ) then
                -- print( word1 )
                -- print( word2 )
                valid = false
                break
            end
        end
        if not valid then
            break
        end
        table.insert( words, word1 )
        table.insert( wordLetters, letters1 )
    end
    if valid then
        numValid = numValid + 1
    end
end

io.write( numValid, " passphrases are valid." )

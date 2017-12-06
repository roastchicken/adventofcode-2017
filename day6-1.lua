io.input( "day6-input.txt" )

io.write( "Please enter your puzzle input: \n" )

local function printTable( tbl )
    for k, v in pairs( tbl ) do
        print( k, v )
    end
end

local function memoryBanksToString( banks )
    local str = ""
    for k, blocks in ipairs( banks ) do
        str = str .. tostring( blocks ) .. " " -- we'll end up with a trailing space but it doesn't matter
    end
    return str
end

local function findLargestBank( banks )
    local max = 0
    local index
    for i, blocks in ipairs( banks ) do
        if blocks > max then
            max = blocks
            index = i
        end
    end
    
    --print( "largest bank was index " .. index .. " with " .. banks[ index ] .. " blocks " )
    
    return index
end

local input = io.read()
local memoryBanks = {}

for number in string.gmatch( input, "%d+" ) do
    table.insert( memoryBanks, tonumber( number ) )
end

--printTable( memoryBanks )
--print( memoryBanksToString( memoryBanks ) )
--print( findLargestBank( memoryBanks ) )

local history = {}
local cycles = 0
local dejavu = false

while not dejavu do
    local biggestBankIndex = findLargestBank( memoryBanks )
    local banksToDistribute = memoryBanks[ biggestBankIndex ]
    --print( "there are " .. banksToDistribute .. " banks to distribute " )
    memoryBanks[ biggestBankIndex ] = 0
    
    for i = 1, banksToDistribute do
        local index = biggestBankIndex + i
        if index > #memoryBanks then
            --io.write( "[DEBUG] looping index back around, from ", index )
            index = index - #memoryBanks
            --io.write( " to ", index, " [DEBUG]\n" )
        end
        
        memoryBanks[ index ] = memoryBanks[ index ] + 1
        banksToDistribute = banksToDistribute - 1
    end
    
    local currentBanksString = memoryBanksToString( memoryBanks )
    
    for k, banksString in ipairs( history ) do
        if currentBanksString == banksString then
            dejavu = true
        end
    end
    
    table.insert( history, currentBanksString )
    --print( currentBanksString )
    
    cycles = cycles + 1
end

io.write( cycles, " redistribution cycles were completed before a duplicate arrangement was reached" )

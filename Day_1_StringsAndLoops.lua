--Write Variables
local playerName = "faillord333"
local toolName = "shovel"
local level = 1

--Concatenate and print messages:
print("welcome " .. playerName .. " ! Your " .. toolName.. " is level " .. level)

--Add simple math + string:
level += 1
print(playerName .. " upgraded the " .. toolName .. " to level " .. level)

--Experiment with string methods:
local msg = "Garden cleaned"
print(string.upper(msg))
print(string.len(msg))

--Create a list (table):
local trash = {"Bottle", "Can", "Plastic", "Old Boot"}

--Loop with for i = …:
for i = 1, #trash do 
	print("Cleaning: " .. trash[i])
end

--Loop with pairs/ipairs:
for index, item in ipairs(trash) do
	print(index, item)
end

--Write a function
local function CleanGarden(trashlist)
	for _, item in ipairs(trashlist) do print ("Removed " .. item) 
		end
		print("Garden clean! Total items: " .. #trashlist)
end

CleanGarden(trash)

--⚔️ Day 1 – Challenge Task: “Trash Tracker”

local rubble = {"bottle", "shovel", "tire", "bone", "boot"}

local function cleanrubble (rubblelist)
	local cleanCount = 0
	local total = #rubblelist
	for _, item in ipairs (rubblelist) do
		
		if item == "boot" then
			print ("Skipping Boot!")
			continue
		end
		
		print("cleaned " .. item)
		cleanCount+= 1
	end
	print("Cleanup Complete! " .. cleanCount .. " of " .. total .. " items removed! ")
end

cleanrubble(rubble)
